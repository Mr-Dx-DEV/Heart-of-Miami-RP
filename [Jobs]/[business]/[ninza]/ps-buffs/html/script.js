let buffs = {};
let hudVisible = true;
let lastBuffState = '';
let lastUpdateTime = Date.now();

// Buff icon mapping
const buffIcons = {
    'stamina': '🏃',
    'swimming': '🏊',
    'hacking': '💻',
    'intelligence': '🧠',
    'luck': '🍀',
    'strength': '💪',
    'super-health': '❤️',
    'super-armor': '🛡️',
    'super-stress': '😌',
    'stress': '😌',
    'super-hunger': '🍔',
    'super-thirst': '💧'
};

// Format time from milliseconds to readable format
function formatTime(ms) {
    const seconds = Math.floor(ms / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);

    if (hours > 0) {
        return `${hours}h ${minutes % 60}m`;
    } else if (minutes > 0) {
        return `${minutes}m ${seconds % 60}s`;
    } else {
        return `${seconds}s`;
    }
}

// Update the buff display
function updateBuffDisplay() {
    const container = document.getElementById('buff-container');
    const buffList = document.getElementById('buff-list');

    if (!hudVisible) {
        container.classList.remove('show');
        return;
    }

    // Filter out buffs with 0 or negative time
    const validBuffs = Object.entries(buffs).filter(([_, time]) => time > 0);

    // Check if buffs have changed (not just time)
    const currentBuffState = validBuffs.map(([name]) => name).sort().join(',');
    const shouldRebuild = currentBuffState !== lastBuffState;

    if (validBuffs.length === 0) {
        container.classList.remove('show');
        lastBuffState = '';
        return;
    }

    // Only rebuild DOM if buffs added/removed
    if (shouldRebuild) {
        buffList.innerHTML = '';

        validBuffs.forEach(([buffName, buffTime]) => {
            const buffItem = document.createElement('div');
            buffItem.className = `buff-item ${buffName}`;
            buffItem.setAttribute('data-buff', buffName);

            const iconSpan = document.createElement('span');
            iconSpan.className = 'buff-icon';
            iconSpan.textContent = buffIcons[buffName] || '⭐';

            const timeSpan = document.createElement('span');
            timeSpan.className = 'buff-time';
            timeSpan.textContent = formatTime(buffTime);

            buffItem.appendChild(iconSpan);
            buffItem.appendChild(timeSpan);
            buffList.appendChild(buffItem);
        });

        lastBuffState = currentBuffState;
    } else {
        // Just update times without rebuilding
        validBuffs.forEach(([buffName, buffTime]) => {
            const buffItem = buffList.querySelector(`[data-buff="${buffName}"]`);
            if (buffItem) {
                const timeSpan = buffItem.querySelector('.buff-time');
                if (timeSpan) {
                    const newTime = formatTime(buffTime);
                    timeSpan.textContent = newTime;

                    // Fade out when time is very low
                    if (buffTime <= 3000) {
                        buffItem.style.opacity = buffTime / 3000;
                    }
                }
            }
        });
    }

    container.classList.add('show');
}

// Listen for messages from the game
window.addEventListener('message', (event) => {
    const data = event.data;

    switch(data.action) {
        case 'updateBuffs':
            buffs = data.buffs || {};
            lastUpdateTime = Date.now();
            updateBuffDisplay();
            break;

        case 'toggleHUD':
            hudVisible = data.show;
            updateBuffDisplay();
            break;

        case 'show':
            hudVisible = true;
            updateBuffDisplay();
            break;

        case 'hide':
            hudVisible = false;
            updateBuffDisplay();
            break;
    }
});

// Client-side countdown for smooth updates
setInterval(() => {
    if (hudVisible && Object.keys(buffs).length > 0) {
        const timePassed = Date.now() - lastUpdateTime;

        // Decrease buff times locally
        for (let buffName in buffs) {
            if (buffs[buffName] > 0) {
                buffs[buffName] = Math.max(0, buffs[buffName] - 1000);
            }
        }

        lastUpdateTime = Date.now();
        updateBuffDisplay();
    }
}, 1000);

// Initial display
updateBuffDisplay();

