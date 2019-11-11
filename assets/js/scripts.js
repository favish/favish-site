const caseStudiesContainer = document.getElementById('caseStudies');
const caseStudies = caseStudiesContainer.querySelectorAll('.case-study');
const nextCaseButton = document.getElementById('nextCase');
const previousCaseButton = document.getElementById('previousCase');

let currentIndex = 0;

function hideAllCaseStudies() {
  caseStudies.forEach(function(element, index) {
    element.classList.add('hidden');
  });
}

function showCaseStudyAtCurrentIndex() {
  caseStudies.forEach(function(element, index) {
    if(index === currentIndex) {
      element.classList.remove('hidden');
    }
  });
}

nextCaseButton.addEventListener('click', function(e) {
  e.preventDefault();

  hideAllCaseStudies();

  currentIndex += 1;

  if(currentIndex > caseStudies.length -1) {
    currentIndex = 0;
  }

  showCaseStudyAtCurrentIndex();

});

previousCaseButton.addEventListener('click', function(e) {
  e.preventDefault();

  hideAllCaseStudies();

  currentIndex -= 1;

  if(currentIndex < 0) {
    currentIndex = caseStudies.length - 1;
  }

  showCaseStudyAtCurrentIndex();

});