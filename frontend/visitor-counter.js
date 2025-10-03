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
        console.log('Sending visitor ID:'); 

        // deployed API Gateway endpoint
        const API_URL = 'https://o47jxf88ie.execute-api.eu-west-2.amazonaws.com/visitor-count';

        // POST request with JSON body
        const response = await fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ visitorId })
        });
        console.log('Response status:', response.status);

        if (response.ok) {
            const data = await response.json();
            console.log('Visitor count received:', data);
            countElement.textContent = data.count;
        } else {
            
            const errorText = await response.text();
            console.error('Error response:', errorText);
            
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