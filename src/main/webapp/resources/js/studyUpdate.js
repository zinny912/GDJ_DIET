const studyStartPeriod = document.getElementById("studyStartPeriod");
const studyEndPeriod = document.getElementById("studyEndPeriod");
const studyStartResult = document.getElementById("studyStartResult");

studyStartPeriod.addEventListener("change", () => {
    const startDate = new Date(studyStartPeriod.value);
    const endDate = new Date(studyEndPeriod.value);
    if (startDate > endDate) {
      studyStartResult.textContent = "옳지 않은 날짜 형식 입니다";
    } else {
      studyStartResult.textContent = "";
    }
  });

  studyEndPeriod.addEventListener("change", () => {
    const startDate = new Date(studyStartPeriod.value);
    const endDate = new Date(studyEndPeriod.value);
    if (startDate > endDate) {
      studyEndResult.textContent = "옳지 않은 날짜 형식 입니다";
    } else {
      studyEndResult.textContent = "";
    }
  }
  );