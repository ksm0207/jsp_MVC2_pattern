<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 라이브러리 사용 선언부(core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 라이브러리 사용 선언부(function)-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- jstl 라이브러리 사용 선언부(fmt)-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="now" value="<%=new Date()%>"></c:set>
<!-- formatDate value로 현재 날짜를 작성할 수 있다 -->
<!-- pattern 으로 현재 날짜를 어떻게 표현할 건지 정해줄 수 있음 -->
<!-- mm 은 분을 의미함 -->
<!-- MM 은 월로 표현됨 -->

<h2><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/> </h2>
<!-- 아래는 pattern을 적용하지 않은 구문이다. -->
<h2><fmt:formatDate value="${now}"/> </h2>
<br>

<!--  시 분 초를 나타낸 구문이다. -->
<!--  (a)hh:mm:ss  이 구문에서 (a)는 오전을 나타낸다 -->
<h2><fmt:formatDate value="${now}" pattern="(a)hh시mm분ss초"/> </h2>

<br>
<!-- 다음은 formatNumber를 알아보자. -->
<!-- groupingUsed : 디폴트값으로 true를 가지고 있고 생략이 가능하다 -->
<!--                숫자를 콤마 단위로 나눌수 있게 된다. -->

<h2><fmt:formatNumber value="12000000" groupingUsed="true"></fmt:formatNumber></h2>
<!-- groupingUsed 디폴트 값을 false로 바꿔본 결과다 -->
<h2><fmt:formatNumber value="12000000" groupingUsed="false"></fmt:formatNumber></h2>

<!-- groupingUsed 대신 pattern으로 적용해보자 -->
<h2><fmt:formatNumber value="12000000" pattern="#,###"></fmt:formatNumber></h2>
<h2><fmt:formatNumber value="12000000" pattern="#,##0.00"></fmt:formatNumber></h2>

<!--  #은 숫자 자리수를 의미한다. -->
<!--  000120000 이라는 숫자가 오면 앞에 0 숫자는 의미가 없는걸로 이해해서
      생략하고 표현해줄 수 있다 
      #,##0.00 이라고 명시된 부분은 소수점 자리를 나타내고 0.00을 포함하여
      나타낸다.
  -->
<br>
  
<h2><fmt:formatNumber value="0.195" type="percent" pattern="0.00%"></fmt:formatNumber></h2>  
<h2><fmt:formatNumber value="0.195" type="percent" ></fmt:formatNumber></h2>  



</body>
</html>