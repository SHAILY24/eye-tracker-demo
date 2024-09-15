// Get elements
const statusText = document.getElementById('status');
const startButton = document.getElementById('startButton');
const calibrationArea = document.getElementById('calibrationArea');
const calibrationBox = document.getElementById('calibrationBox');
const calibrationPoint = document.getElementById('calibrationPoint');
const calibrationInstructions = document.getElementById('calibrationInstructions');
const progressFill = document.querySelector('.progress-fill');
const gameArea = document.getElementById('gameArea');
const target = document.getElementById('target');
const instructions = document.getElementById('instructions');
const gazePointer = document.getElementById('gazePointer');
const debugInfo = document.getElementById('debugInfo');
const webgazerVideo = document.getElementById('webgazerVideoFeed');

// Calibration and game state
let isCalibrating = false;
let isPlaying = false;
let calibrationData = [];
let calibrationPoints = [];
let currentCalibrationPoint = 0;
let calibrationSamples = [];
let samplesPerPoint = 20; // Increased samples per point
let calibrationModel = null; // For storing the regression model

// Initialize WebGazer
function initializeWebGazer() {
    webgazer
        .setRegression('ridge')
        .setTracker('TFFacemesh')
        .setGazeListener((data, elapsedTime) => {
            if (data == null || !data.x || !data.y) return;

            const x = data.x;
            const y = data.y;

            // Update gaze pointer
            if (isCalibrating || isPlaying) {
                gazePointer.style.display = 'block';
                gazePointer.style.left = `${x}px`;
                gazePointer.style.top = `${y}px`;

                if (isPlaying && calibrationModel) {
                    const calibratedGaze = predictCalibratedGaze(x, y);
                    gazePointer.style.left = `${calibratedGaze.x}px`;
                    gazePointer.style.top = `${calibratedGaze.y}px`;
                    checkGazeOnTarget(calibratedGaze);
                }
            } else {
                gazePointer.style.display = 'none';
            }
        })
        .begin();

    // Configure video feed
    webgazer.showVideoPreview(true).showPredictionPoints(false);
    webgazer.applyKalmanFilter(true);

    // Update status
    statusText.innerText = 'Eye tracking initialized. Position your face in the box.';
}

// Start Calibration
function startCalibration() {
    isCalibrating = true;
    startButton.style.display = 'none';
    calibrationArea.style.display = 'block';
    gameArea.style.display = 'none';
    statusText.innerText = 'Calibrating...';
    calibrationData = [];
    currentCalibrationPoint = 0;
    calibrationSamples = [];
    progressFill.style.width = '0%';

    // Define calibration points
    calibrationPoints = [
        { x: 10, y: 10 },
        { x: 50, y: 10 },
        { x: 90, y: 10 },
        { x: 10, y: 50 },
        { x: 50, y: 50 },
        { x: 90, y: 50 },
        { x: 10, y: 90 },
        { x: 50, y: 90 },
        { x: 90, y: 90 }
    ];

    moveToNextCalibrationPoint();
}

// Move to the next calibration point
function moveToNextCalibrationPoint() {
    if (currentCalibrationPoint < calibrationPoints.length) {
        const point = calibrationPoints[currentCalibrationPoint];

        calibrationPoint.style.left = `${point.x}%`;
        calibrationPoint.style.top = `${point.y}%`;

        calibrationSamples = [];
        updateCalibrationInstructions();
    } else {
        finishCalibration();
    }
}

// Update calibration instructions
function updateCalibrationInstructions() {
    calibrationInstructions.innerHTML = `
        <p>Point ${currentCalibrationPoint + 1} of ${calibrationPoints.length}</p>
        <p>Samples collected: ${calibrationSamples.length}/${samplesPerPoint}</p>
        <p>Focus on the red dot and press SPACE</p>
    `;

    // Update progress bar
    const progress = (currentCalibrationPoint / calibrationPoints.length) * 100;
    progressFill.style.width = `${progress}%`;
}

// Collect calibration data
function collectCalibrationData() {
    const point = calibrationPoints[currentCalibrationPoint];
    const actualX = (point.x / 100) * window.innerWidth;
    const actualY = (point.y / 100) * window.innerHeight;

    calibrationSamples.forEach(sample => {
        calibrationData.push({
            measuredX: sample.x,
            measuredY: sample.y,
            actualX: actualX,
            actualY: actualY
        });
    });

    currentCalibrationPoint++;
    moveToNextCalibrationPoint();
}

// Finish Calibration
function finishCalibration() {
    isCalibrating = false;
    calibrationArea.style.display = 'none';
    statusText.innerText = 'Calibration complete! Starting game...';

    // Train calibration model
    trainCalibrationModel();

    startGame();
}

// Train calibration model using multiple linear regression
function trainCalibrationModel() {
    const xMeasured = calibrationData.map(d => [d.measuredX, d.measuredY]);
    const xActual = calibrationData.map(d => [d.actualX, d.actualY]);

    // Use simple linear regression for x and y separately
    calibrationModel = {
        x: calculateRegression(xMeasured, xActual.map(d => d[0])),
        y: calculateRegression(xMeasured, xActual.map(d => d[1]))
    };
}

// Calculate regression coefficients
function calculateRegression(inputs, outputs) {
    // Add bias term
    const x = inputs.map(i => [1, ...i]);
    const xT = math.transpose(x);
    const xTx = math.multiply(xT, x);
    const xTxInv = math.inv(xTx);
    const xTy = math.multiply(xT, outputs);
    const coefficients = math.multiply(xTxInv, xTy);
    return coefficients;
}

// Predict calibrated gaze using the regression model
function predictCalibratedGaze(measuredX, measuredY) {
    const input = [1, measuredX, measuredY];
    const x = math.dot(calibrationModel.x, input);
    const y = math.dot(calibrationModel.y, input);
    return { x: x, y: y };
}

// Start Game
function startGame() {
    isPlaying = true;
    gameArea.style.display = 'block';
    moveTarget();
}

// Move the target to a random position
function moveTarget() {
    const gameRect = gameArea.getBoundingClientRect();
    const margin = 50;
    const targetSize = 30;

    const targetX = Math.random() * (gameRect.width - margin * 2 - targetSize) + margin;
    const targetY = Math.random() * (gameRect.height - margin * 2 - targetSize) + margin;

    target.style.left = `${targetX}px`;
    target.style.top = `${targetY}px`;
}

// Check if gaze is on target
function checkGazeOnTarget(gaze) {
    const targetRect = target.getBoundingClientRect();
    const buffer = 30; // Increased hit area

    if (
        gaze.x >= targetRect.left - buffer &&
        gaze.x <= targetRect.right + buffer &&
        gaze.y >= targetRect.top - buffer &&
        gaze.y <= targetRect.bottom + buffer
    ) {
        moveTarget();
    }
}

// Handle spacebar press during calibration
document.addEventListener('keydown', (e) => {
    if (e.code === 'Space' && isCalibrating) {
        webgazer.getCurrentPrediction().then(prediction => {
            if (prediction) {
                calibrationSamples.push({ x: prediction.x, y: prediction.y });
                updateCalibrationInstructions();

                if (calibrationSamples.length >= samplesPerPoint) {
                    collectCalibrationData();
                }
            }
        });
    }
});

startButton.addEventListener('click', () => {
    if (!isCalibrating && !isPlaying) {
        startCalibration();
    }
});

document.addEventListener('DOMContentLoaded', () => {
    initializeWebGazer();
});

window.addEventListener('unload', () => {
    webgazer.end();
});