<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>상품설명 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/reset2.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/detailList.css" />

<!-- Axios 라이브러리 포함 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- header + nav -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


		<!-- 컨텐츠 -->
		<div id="contents" class="clearfix">
			<div class="clearfix">
				<!-- 상품 이미지 박스 -->
				<div id="profile">
					<div>
						<img id="img1"
							src="${pageContext.request.contextPath}/upload/${product.saveName}" />
					</div>
					<div id="small-img">
						<c:forEach items="${requestScope.productSeries}" var="ProductVo">
							<img id="i-${product.prodNo}" class="img2"
								src="${pageContext.request.contextPath}/upload/${ProductVo.saveName}"
								data-prodprice="${ProductVo.prodPrice}"
								data-engname="${ProductVo.engName}"
								data-korname="${ProductVo.korName}"
								data-modelno="${ProductVo.modelNo}"
								data-releasedate="${ProductVo.releaseDate}"
								data-colorname="${ProductVo.colorName}" />
						</c:forEach>
					</div>
				</div>

				<!-- 상품 설명 -->
				<div id="explain-box" class="clearfix">
					<div class="price-box">
						<p class="price1">구매가</p>
						<p class="price2" data-prodprice="${product.prodPrice}">${product.prodPrice}원</p>
					</div>

					<div class="name-box">
						<p class="title">${product.engName}</p>
						<p class="sub-title">${product.korName}</p>
					</div>

					<!-- 사이즈 옵션 선택 -->
					<div class="form-size">
						<p id="selected-size">모든 사이즈</p>
						<div class="more">▼</div>
					</div>

					<!--모달창 -->
					<div id="buy-modal">
						<div class="purchase-modal" id="purchaseModal">
							<div class="modal-header">
								<h1>사이즈 변경</h1>
								<button class="close-btn" type="button">&times;</button>
							</div>

							<div class="product-info">
								<img id="img2" src="" alt="shoes" />
								<div>
									<h2 id="eng-name">영문명</h2>
									<p id="kor-name" class="product-id">한글명</p>
									<p id="model-no" class="product-id">모델번호</p>
								</div>
							</div>
							<input type="hidden" id="selectCartNo" value="">
							<div class="size-grid">
								<!-- 사이즈 버튼들 -->
								<button id="size230" class="size-box" data-prodsize="230">230</button>
								<button id="size235" class="size-box" data-prodsize="235">235</button>
								<button id="size240" class="size-box" data-prodsize="240">240</button>
								<button id="size245" class="size-box" data-prodsize="245">245</button>
								<button id="size250" class="size-box" data-prodsize="250">250</button>
								<button id="size255" class="size-box" data-prodsize="255">255</button>
								<button id="size260" class="size-box" data-prodsize="260">260</button>
								<button id="size265" class="size-box" data-prodsize="265">265</button>
								<button id="size270" class="size-box" data-prodsize="270">270</button>
								<button id="size275" class="size-box" data-prodsize="275">275</button>
								<button id="size280" class="size-box" data-prodsize="280">280</button>
							</div>
						</div>
					</div>
					<!--//모달창-->

					<!-- 부가설명 -->
					<div id="add-explain" class="clearfix">
						<div class="detail-box">
							<p class="txt-explain">모델번호</p>
							<p id="modelNo" class="txt-explain2">${product.modelNo}</p>
						</div>
						<div class="detail-box">
							<p class="txt-explain">출시일</p>
							<p id="releaseDate" class="txt-explain2">${product.releaseDate}</p>
						</div>
						<div class="detail-box">
							<p class="txt-explain">대표색상</p>
							<p id="colorName" class="txt-explain2">${product.colorName}</p>
						</div>
					</div>
					<input type="hidden" id="selectProdNo" value="${product.prodNo}">
					<!-- 구매버튼, 관심상품 버튼 -->
					<div id="btn-action" class="clearfix">
						<button id="btn1" class="clearfix" type="button">장바구니로 이동</button>
						<button id="btn2" type="button">관심상품</button>
					</div>

					<!-- 배송 정보 -->
					<div id="delivery" class="clearfix">
						<h1>배송정보</h1>
						<div class="delivery-info">
							<img
								src="${pageContext.request.contextPath}/assets/imgs/express.jpg" />
							<div class="badge-title">
								<p class="types">빠른배송</p>
								<p class="txt-badge">3일 내 도착 예정</p>
							</div>
						</div>
						<div class="delivery-info">
							<img
								src="${pageContext.request.contextPath}/assets/imgs/standard.jpg" />
							<div class="badge-title">
								<p class="types">일반배송</p>
								<p class="txt-badge">검수 후 배송 ・ 5-7일 내 도착 예정</p>
							</div>
						</div>
						<div class="delivery-info">
							<img
								src="${pageContext.request.contextPath}/assets/imgs/warehouse.jpg" />
							<div class="badge-title">
								<p class="types">창고보관</p>
								<p class="txt-badge">배송 없이 창고에 보관 ・ 빠르게 판매 가능</p>
							</div>
						</div>
					</div>
					<!-- //배송 정보 -->
				</div>
			</div>

			<!-- 테이블 -->
			<div id="size-box">
				<div>
					<h3>사이즈 정보</h3>
				</div>
				<table>
					<tr class="color">
						<td>JP</td>
						<td>230</td>
						<td>235</td>
						<td>240</td>
						<td>245</td>
						<td>250</td>
						<td>255</td>
						<td>260</td>
						<td>265</td>
						<td>270</td>
						<td>275</td>
						<td>280</td>
					</tr>
					<tr>
						<td class="color">KR</td>
						<td>230</td>
						<td>235</td>
						<td>240</td>
						<td>245</td>
						<td>250</td>
						<td>255</td>
						<td>260</td>
						<td>265</td>
						<td>270</td>
						<td>275</td>
						<td>280</td>
					</tr>
					<tr>
						<td class="color">US (M)</td>
						<td>5</td>
						<td>5.5</td>
						<td>6</td>
						<td>6.5</td>
						<td>7</td>
						<td>7.5</td>
						<td>8</td>
						<td>8.5</td>
						<td>9</td>
						<td>9.5</td>
						<td>10</td>
					</tr>
					<tr>
						<td class="color">US (W)</td>
						<td>6</td>
						<td>6.5</td>
						<td>7</td>
						<td>7.5</td>
						<td>8</td>
						<td>8.5</td>
						<td>9</td>
						<td>9.5</td>
						<td>10</td>
						<td>10.5</td>
						<td>11</td>
					</tr>
					<tr>
						<td class="color">UK</td>
						<td>4.5</td>
						<td>5</td>
						<td>5.5</td>
						<td>6</td>
						<td>6.5</td>
						<td>7</td>
						<td>7.5</td>
						<td>8</td>
						<td>8.5</td>
						<td>9</td>
						<td>9.5</td>
					</tr>
				</table>
				<p>* 해당 사이즈 정보는 고객 이해를 위한 참고용이며, 브랜드마다 또는 상품 카테고리마다 차이가 있을 수
					있습니다. 정확한 내용은 실물 상품 기준으로 공식 제조사/유통사에 확인해 주시기 바랍니다.</p>
			</div>
			<!-- //테이블 -->
		</div>


		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
	<!-- //wrap-->

	<script>
	document.addEventListener("DOMContentLoaded", function() {

	    // "모든 사이즈" 버튼을 선택
	    let sizeButton = document.querySelector('.form-size');

	    // 모달창과 닫기 버튼을 선택
	    let modalTag = document.querySelector('#buy-modal');
	    let closeBtn = document.querySelector('.close-btn');

	    // "모든 사이즈" 버튼 클릭 시 모달창 열기
	    sizeButton.addEventListener('click', function(event) {
	        openModal(modalTag, event); // event 객체를 전달
	    });

	    // 닫기 버튼 클릭 시 모달창 닫기
	    closeBtn.addEventListener('click', function() {
	        closeModal(modalTag);
	    });

	    // 사이즈 버튼 클릭 이벤트
	    let sizeButtons = document.querySelectorAll(".size-box");
	    for (let i = 0; i < sizeButtons.length; i++) {
	        sizeButtons[i].addEventListener('click', function(event) {
	            ButtonClick(event);
	        });
	    }
	    
	 // 작은 이미지 클릭 시 큰 이미지 변경 및 보더 추가
	    let smallImages = document.querySelectorAll(".img2");
	    for (let i = 0; i < smallImages.length; i++) {
	        smallImages[i].addEventListener('click', function(event) {
	            changeImage(event.target.src);  // 작은 이미지 클릭 시 큰 이미지 변경
	            setActiveBorder(event.target);  // 선택된 이미지에 보더 추가
	            updateProductDetails(event.target); // 선택된 이미지 값으로 설명 변경
	        });
	    }
	});

	// 모달창 열기 함수 (상품 정보 포함)
	function openModal(modal, event) {
	    // 버튼에서 부모 요소로 이동하여 필요한 정보를 가져옴
	    let productDiv = event.target.closest('#contents'); // 상위 요소로 이동

	    if (!productDiv) {
	        console.error("상품 정보를 가져올 수 없습니다.");
	        return;
	    }

	    // 상품 정보 태그들
	    let imgTag = productDiv.querySelector('#img1'); // 상품 이미지
	    let nameTag1 = productDiv.querySelector('.title'); // 영어 이름
	    let nameTag2 = productDiv.querySelector('.sub-title'); // 한글 이름
	    let modelNoTag = productDiv.querySelector('.txt-explain2'); // 모델 번호 (대표색상 앞)

	    // 모달창 내부 요소들
	    let modaImg = document.querySelector('#img2');
	    let name1 = document.querySelector('#eng-name');
	    let name2 = document.querySelector('#kor-name');
	    let modelNo = document.querySelector('#model-no');

	    modaImg.src = imgTag.src;
	    name1.textContent = nameTag1.textContent;
	    name2.textContent = nameTag2.textContent;
	    modelNo.textContent = modelNoTag.textContent;

	    // 모달창 보이기
	    modal.style.display = 'block';
	}

	// 모달창 닫기 함수
	function closeModal(modal) {
	    modal.style.display = 'none';
	}
	
	
	// 전역 변수로 selectedSize를 저장
	let selectedSize = null;

	// 사이즈 버튼 클릭 시 사이즈 값을 설정
	function ButtonClick(event) {
	    selectedSize = event.target.getAttribute('data-prodsize');
	    let prodNo = document.querySelector('#selectProdNo').value;

	    // 선택한 사이즈 표시
	    let selectedSizeText = document.getElementById("selected-size");
	    selectedSizeText.textContent = selectedSize;

	    // 모달창 닫기
	    let modalTag = document.querySelector('#buy-modal');
	    closeModal(modalTag);
	}

	// 장바구니 버튼 클릭 이벤트
	document.getElementById('btn1').addEventListener('click', function() {
	    if (!selectedSize) {
	        alert("사이즈를 먼저 선택해 주세요.");
	    } else {
	        let prodNo = document.querySelector('#selectProdNo').value;

	        // Axios request to send the selected size to shopping cart
	        axios({
	            method: 'post', 
	            url: '${pageContext.request.contextPath}/api/shoppingcart/insert',
	            headers: {"Content-Type": "application/json; charset=utf-8"}, 
	            data: {
	                prodSize: selectedSize, 
	                prodNo: prodNo
	            }
	        }).then(function (response) {
	            alert("장바구니로 이동되었습니다");
	        }).catch(function (error) {
	            console.log("장바구니 추가 중 오류:", error);
	            alert("장바구니에 추가하는 중 문제가 발생했습니다. 다시 시도해 주세요.");
	        });
	    }
	});

	// 관심상품 버튼 클릭 이벤트
	document.getElementById('btn2').addEventListener('click', function() {
	    if (!selectedSize) {
	        alert("사이즈를 먼저 선택해 주세요.");
	    } else {
	        let prodNo = document.querySelector('#selectProdNo').value;

	        // Axios request to add the product to the favorites
	        axios({
	            method: 'post', 
	            url: '${pageContext.request.contextPath}/api/favorite/insert',
	            headers: {"Content-Type": "application/json; charset=utf-8"}, 
	            data: {
	                prodSize: selectedSize, 
	                prodNo: prodNo
	            }
	        }).then(function (response) {
	            alert("관심목록에 추가되었습니다");
	        }).catch(function (error) {
	            console.log("관심목록 추가 중 오류:", error);
	            alert("관심목록에 추가하는 중 문제가 발생했습니다. 다시 시도해 주세요.");
	        });
	    }
	});
	
	// 작은 이미지 클릭 시 큰 이미지 변경 함수
	function changeImage(newSrc) {
	    document.getElementById("img1").src = newSrc;
	    
	    
	}
	
	// 선택된 작은 이미지에 보더 추가 및 나머지 보더 제거 함수
	function setActiveBorder(selectedImage) {
	    let smallImages = document.querySelectorAll(".img2");
	    
	    // 모든 이미지의 보더 제거
	    smallImages.forEach(function(img) {
	        img.style.border = "none";
	    });
	    
	    // 클릭한 이미지에만 보더 추가
	    selectedImage.style.border = "1px solid #000";  // 원하는 보더 스타일 적용
	}
	
	function updateProductDetails(newValue) {
		// 각 이미지의 data-* 속성을 통해 정보를 가져옴
	    let price = newValue.dataset.prodprice;
		let engName = newValue.dataset.engname;
		let korName = newValue.dataset.korname;
		let modelNo = newValue.dataset.modelno;
		let releaseDate = newValue.dataset.releasedate;
		let colorName = newValue.dataset.colorname;

	    // 가져온 정보를 상품 설명에 업데이트
	    document.querySelector(".price2").textContent = price + "원";
	    document.querySelector(".title").textContent = engName;
	    document.querySelector(".sub-title").textContent = korName;
	    document.getElementById("modelNo").textContent = modelNo;
	    document.getElementById("releaseDate").textContent = releaseDate;
	    document.getElementById("colorName").textContent = colorName;
		
	}
	



	</script>
</body>
</html>