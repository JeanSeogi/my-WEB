<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>임대 목록</title>
        <link rel="stylesheet" href="임대.css"/>
      </head>
      <body>
        <h2>임대 목록</h2>
        <div class="table-container">
          <table>
            <thead>
              <tr>
                <th rowspan="2">호</th>
                <th rowspan="2">계약일</th><th>입주일</th><th>기간</th><th>구분</th>
                <th rowspan="2">보증금</th><th>계약금</th>
                <th rowspan="2">차임</th><th rowspan="2">관리</th><th rowspan="2">월납</th>
                <th rowspan="2">성명</th><th>주민번호</th>
                <th rowspan="2">주소</th>
              </tr>
              <tr>
                <th>만기일</th><th>형태</th><th>지불</th><th>잔금</th><th>전화</th>
              </tr>
            </thead>
            <tbody>
              <style>
                td.text   { text-align: left; }
                td.number { text-align: right; }
                td.date   { white-space: nowrap; }
                td.nowrap { white-space: nowrap; }
                tr.high-value td { background-color:rgba(255, 236, 209, 0.67); } /* 큰 금액 강조 */
              </style>
              <xsl:for-each select="dataroot/임대">
                <tr class="record-row1">
                  <td rowspan="2"               ><xsl:value-of select="호"/></td>
                  <td rowspan="2" class="date"  ><xsl:value-of select="substring-before(계약일, 'T')"/></td>
                  <td             class="date"  ><xsl:value-of select="substring-before(입주일, 'T')"/></td>
                  <td                           ><xsl:value-of select="기간"/></td>
                  <td                           ><xsl:value-of select="구분"/></td>
                  <td rowspan="2" class="number"><xsl:value-of select="format-number(보증금, '#,###')"/></td>
                  <td             class="number"><xsl:value-of select="format-number(계약금, '#,###')"/></td>
                  <td rowspan="2" class="number"><xsl:value-of select="format-number(차임, '#,###')"/></td>
                  <td rowspan="2" class="number"><xsl:value-of select="format-number(관리, '#,###')"/></td>
                  <td rowspan="2" class="number"><xsl:value-of select="format-number(월납, '#,###')"/></td>
                  <td rowspan="2"               ><xsl:value-of select="성명"/></td>
                  <td             class="nowrap"><xsl:value-of select="주민번호"/></td>
                  <td rowspan="2" class="text"  ><xsl:value-of select="주소"/></td>
                </tr>
                <tr class="record-row2">
                  <td             class="date"  ><xsl:value-of select="substring-before(만기일, 'T')"/></td>
                  <td                           ><xsl:value-of select="형태"/></td>
                  <td                           ><xsl:value-of select="지불"/></td>
                  <td             class="number"><xsl:value-of select="format-number(잔금, '#,###')"/></td>
                  <td             class="nowrap"><xsl:value-of select="전화번호"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <script type="text/javascript" src="임대.js"></script>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>