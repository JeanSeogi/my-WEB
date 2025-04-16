<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>임대 목록</title>
        <style>
          body {
            font-family: "Arial Narrow Bold", sans-serif;
            margin: 20px;
            background-color: #303030;
          }
          h2 {
            text-align: left;
            color: #4CAF50;
            margin-bottom: 10px;
            position: sticky;
            top: 0;
            background-color: #303030; /* 헤더와 같은 배경색 */
            z-index: 1;
          }
          .table-container {
            height: 80vh;       /* 화면 높이의 80%로 설정 */
            max-height: 90vh;   /* 최대 높이 제한 */
            overflow-y: auto;   /* 세로 스크롤 활성화 */
            border: 1px solid #ddd;
            background-color: white;
          }
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
          }
          th {
            background-color: #4CAF50;
            color: white;
            position: sticky;   /* 헤더를 고정 */
            top: 0;             /* 헤더가 화면 상단에 고정 */
            z-index: 2;         /* 헤더가 내용 위에 위치 */
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          tr:hover {
            background-color:rgba(76, 175, 79, 0.7);
          }
        </style>
      </head>
      <body>
        <h2>임대 목록</h2>
        <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>호</th>
              <th>계약일</th><th>입주일</th><th>만기일</th><th>기간</th>
              <th>구분</th><th>형태</th><th>지불</th>
              <th>보증금</th><th>계약금</th><th>잔금</th><th>차임</th><th>관리</th><th>월납</th>
              <th>성명</th><th>주민번호</th><th>전화</th>
            </tr>
            <tr>
              <th>주소</th>
            </tr>
          </thead>
          <tbody>
            <style>
              td.text   { text-align: left; }
              td.number { text-align: right; }
              td.date   { white-space: nowrap;}
              td.주민번호 { white-space: nowrap;}
              td.전화번호 { white-space: nowrap;}
              tr.high-value td { background-color:rgba(255, 236, 209, 0.67); } /* 큰 금액 강조 */
            </style>
            <xsl:for-each select="dataroot/임대">
              <tr>
                <xsl:attribute name="class">
                  <xsl:if test="보증금 >= 30000000">high-value</xsl:if>
                </xsl:attribute>

                <td><xsl:value-of select="호"/></td>
                <td class="date"><xsl:value-of select="substring-before(계약일, 'T')"/></td>
                <td class="date"><xsl:value-of select="substring-before(입주일, 'T')"/></td>
                <td class="date"><xsl:value-of select="substring-before(만기일, 'T')"/></td>
                <td><xsl:value-of select="기간"/></td>
                <td><xsl:value-of select="구분"/></td>
                <td><xsl:value-of select="형태"/></td>
                <td><xsl:value-of select="지불"/></td>
                <td class="number"><xsl:value-of select="format-number(보증금, '#,###')"/></td>
                <td class="number"><xsl:value-of select="format-number(계약금, '#,###')"/></td>
                <td class="number"><xsl:value-of select="format-number(잔금, '#,###')"/></td>
                <td class="number"><xsl:value-of select="format-number(차임, '#,###')"/></td>
                <td class="number"><xsl:value-of select="format-number(관리, '#,###')"/></td>
                <td class="number"><xsl:value-of select="format-number(월납, '#,###')"/></td>
                <td><xsl:value-of select="성명"/></td>
                <td class="주민번호"><xsl:value-of select="주민번호"/></td>
                <td class="전화번호"><xsl:value-of select="전화번호"/></td>
              </tr>
              <tr>
                <td class="text"><xsl:value-of select="주소"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        </div>
        <caption>임대 계약 내역 요약</caption>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
