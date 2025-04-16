// 테이블 행 호버 효과적용 행이 2줄 단위로 묶여있을 때 (행에 마우스 오버 시 해당 행과 그 다음 행의 배경색을 변경)
document.addEventListener("DOMContentLoaded", () => {
    const rows = document.querySelectorAll("tr.record-row1, tr.record-row2");
  
    rows.forEach(row => {
        // 마우스 오버 이벤트
        row.addEventListener("mouseover", () => {
            const group = row.closest("tbody").rows;                // 모든 행 참조
            const idx = Array.from(group).indexOf(row);             // 현재 행 인덱스
            const targetIdx = idx % 2 === 0 ? idx : idx - 1;        // 홀수/짝수 그룹 판별 (2줄 단위)

            group[targetIdx].classList.add("tr-hover");             // group[targetIdx].style.backgroundColor = "rgb(189, 204, 179)";
            group[targetIdx + 1].classList.add("tr-hover");         // group[targetIdx + 1].style.backgroundColor = "rgb(189, 204, 179)";
        });
  
        // 마우스 아웃 이벤트
        row.addEventListener("mouseout", () => {
            const group = row.closest("tbody").rows;
            const idx = Array.from(group).indexOf(row);
            const targetIdx = idx % 2 === 0 ? idx : idx - 1;

            group[targetIdx].classList.remove("tr-hover");          // group[targetIdx].style.backgroundColor = "";
            group[targetIdx + 1].classList.remove("tr-hover");      // group[targetIdx + 1].style.backgroundColor = "";
        });
    });
});