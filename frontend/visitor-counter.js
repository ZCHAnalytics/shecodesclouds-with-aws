// Generate or retrieve visitor ID
function getVisitorId() {
    let visitorId = localStorage.getItem('visitorId');
    if (!visitorId) {
        visitorId = 'visitor_' + Date.now() + '_' + Math.random().toString(36).substring(2, 11);
        localStorage.setItem('visitorId', visitorId);
    }
    return visitorId;
}

// Update visitor count
async function updateVisitorCount() {
    const countElement = document.getElementById('visitor-count');
    
    if (!countElement) {
        console.warn('Element with id "visitor-count" not found');
        return;
    }

    try {
            const visitorId = getVisitorId();

            // To be replaced with  deployed API Gateway endpoint
            const API_URL = 'https://zch-resume-function.execute-api.eu-west-2.amazonaws.com/dev/visitor-count';

            const response = await fetch(`${API_URL}?visitorId=${encodeURIComponent(visitorId)}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

            if (response.ok) {
                const data = await response.json();
                console.log('Visitor count received:', data);
                countElement.textContent = data.count;
            } else {
                throw new Error(`HTTP ${response.status}`);
            }
        } catch (error) {
            console.error('Error updating visitor count:', error);
            countElement.textContent = 'Error';
        }
    }

// Call on page load
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', updateVisitorCount);
} else {
    updateVisitorCount();
}