    document.addEventListener('DOMContentLoaded', function() {
            const message = document.querySelector('.announcement-bar__message');
            const span = message.querySelector('span');
            
            // Set the height of the container based on the text height
            message.style.height = span.offsetHeight + 'px';
            
            // Clone the span only if needed for continuous scroll
            function ensureContinuousScroll() {
                const spanWidth = span.offsetWidth;
                const containerWidth = message.offsetWidth;
                
                // Only add one clone if we don't already have it
                if (message.children.length === 1) {
                    const clone = span.cloneNode(true);
                    clone.style.transform = 'translateX(100%)';
                    message.appendChild(clone);
                }
            }

            // Initial setup
            ensureContinuousScroll();
            
            // Update on resize
            window.addEventListener('resize', ensureContinuousScroll);
        });



  {
    const piUtilityBar = document.querySelector(".pi-utility-bar");
    document.documentElement.style.setProperty('--pi-utility-bar-height', `${piUtilityBar.offsetHeight}px`);
  }
