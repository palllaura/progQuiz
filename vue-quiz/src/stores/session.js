import { reactive } from 'vue';

export const session = reactive({
    sessionToken: window.sessionStorage.getItem('session'), // Retrieve session token from sessionStorage
    name: window.sessionStorage.getItem('name') || null, // Retrieve user's name from sessionStorage
    highscore: window.sessionStorage.getItem('highscore') || 0, // Retrieve highscore from sessionStorage
    score: parseInt(window.sessionStorage.getItem('score')) || 0,
    highscore_date: null, // Add the highscore_date field
    userId: window.sessionStorage.getItem('userId'),

});

export function setSession(sessionToken, name, highscore, userId, score) {
    session.sessionToken = sessionToken;
    session.name = name;
    session.highscore = highscore;
    session.userId = userId;
    session.score = parseInt(score) || 0;
    window.sessionStorage.setItem('session', sessionToken);
    window.sessionStorage.setItem('name', name);
    window.sessionStorage.setItem('highscore', highscore);
    window.sessionStorage.setItem('userId', userId);
    window.sessionStorage.setItem('score', score);

}

export async function clearSession() {
    try {
        const response = await fetch('/api/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-Session-Token': session.sessionToken
            },
            body: JSON.stringify({
            })
        });

        if (response.ok) {
            session.sessionToken = null;
            session.name = null;
            session.highscore = 0;
            session.userId = null;
            session.score = 0;
            window.sessionStorage.removeItem('session');
            window.sessionStorage.removeItem('name');
            window.sessionStorage.removeItem('highscore');
            window.sessionStorage.removeItem('userId');
            window.sessionStorage.removeItem('score');
        }
    } catch (error) {
        console.error('An error occurred:', error);
    }
}
export function increaseHighScore(points) {
    if (session.score > session.highscore) {
        session.highscore = session.score;
        session.highscore_date = new Date();
        window.sessionStorage.setItem('highscore', session.highscore);
        window.sessionStorage.setItem('highscore_date', session.highscore_date);

        sendHighScoreToDatabase(session.highscore, session.highscore_date, session.userId)
            .then(() => {
                console.log('High score updated in the database.');
            })
            .catch((error) => {
                console.error('Failed to update high score in the database:', error);
            });
    }
}

export function updateScore(points) {
    session.score += points;
}

export function resetScore() {
    session.score = 0;
}

function sendHighScoreToDatabase(highscore, highscore_date, userId ) {
    const endpoint = `/api/users/highscore/${userId}`;

    return fetch(endpoint, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ highscore, highscore_date }),

    }).then((response) => {
        if (!response.ok) {
            console.error('Failed to update high score in the database');
            throw new Error('Failed to update high score in the database');
        }
        console.log("High score updated successfully.");
    });
}