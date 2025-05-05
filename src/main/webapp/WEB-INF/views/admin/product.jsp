<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<script src="https://cdn.tailwindcss.com"></script>
<style>
/* Only keeping necessary custom styles, using Tailwind classes for colors */
:root {
	--header-height: 4rem;
	--sidebar-width: 240px;
}

@
keyframes slideDown {from { transform:translateY(-100%);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes slideUp {from { transform:translateY(20px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.animate-slide-down {
	animation: slideDown 0.5s ease-out;
}

.animate-fade-in {
	animation: fadeIn 0.5s ease-out;
}

.animate-slide-up {
	animation: slideUp 0.5s ease-out forwards;
}
</style>
</head>
<body class="bg-indigo-50 min-h-screen overflow-x-hidden">
	<div
		class="overlay fixed inset-0 bg-indigo-900/50 z-40 hidden opacity-0 transition-opacity duration-300"></div>

	<%@ include file="header.jsp"%>

	<div class="pt-16 max-w-7xl mx-auto flex">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<main class="flex-1 p-4">
			<!--  page content goes here -->
			<c:choose>
				<c:when test="${edit ne true }">
							<div class="container mx-auto px-4 py-12 max-w-3xl">
				<div class="bg-white rounded-2xl shadow-lg p-6 md:p-10">
					<div class="mb-8">
						<h2 class="text-2xl font-bold text-gray-800">Add new product
							detail</h2>
					</div>

					<form action="${pageContext.request.contextPath }/admin/product/save" method="post"
						encType="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />

						<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
							<!-- Product Name -->
							<div>
								<label for="name"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Name</label> <input type="text" id="name" name="name"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter product name">
							</div>

							<!-- Price -->
							<div>
								<label for="price"
									class="block text-sm font-medium text-gray-700 mb-1">Price</label>
								<input type="text" id="price" name="price"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter product price">
							</div>

							<!-- Quantity -->
							<div>
								<label for="quantity"
									class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
								<input type="text" id="quantity" name="quantity"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter product Quantity">
							</div>

							<!-- Discount -->
							<div class="md:col-span-2">
								<label for="discount"
									class="block text-sm font-medium text-gray-700 mb-1">Discount</label>
								<input type="text" id="discount" name="discount"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter discount percentage">
							</div>

							<!-- Product Image -->
							<div class="md:col-span-2">
								<label for="image"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Image</label> <input type="file" id="image" name="image"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Select an image">
							</div>

							<!-- Tags -->
							<div>
								<label for="tags"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Tags</label> <input type="text" id="tags" name="tags"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter suitable tags for the product">
							</div>

							<!-- Description -->
							<div class="md:col-span-2">
								<label for="description"
									class="block text-sm font-medium text-gray-700 mb-1">Description</label>
								<textarea id="description" name="description" rows="5"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									placeholder="Enter full description"></textarea>
							</div>

							<!-- Category -->
							<div>
								<label for="category"
									class="block text-sm font-medium text-gray-700 mb-1">Category</label>
								<select id="category" name="category"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out">
									<option value="" selected disabled>Select your country</option>
									<c:forEach items="${category_list }" var="cat">
										<option value="${cat.id }">${cat.name }</option>
									</c:forEach>
								</select>
							</div>

						</div>

						<!-- Submit Button -->
						<div class="mt-8">
							<button type="submit"
								class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-4 rounded-lg transition duration-150 ease-in-out shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
								Save Product</button>
						</div>


					</form>
				</div>
			</div>
				
				</c:when>
				<c:otherwise>
							<div class="container mx-auto px-4 py-12 max-w-3xl">
				<div class="bg-white rounded-2xl shadow-lg p-6 md:p-10">
					<div class="mb-8">
						<h2 class="text-2xl font-bold text-gray-800">Update new product
							detail</h2>
					</div>

					<form action="${pageContext.request.contextPath }/admin/product/update" method="post"
						encType="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />

						<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
									<div>
								<label for="id"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									product id</label> <input type="text" id="id" name="id"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.id }">
							</div>
							<!-- Product Name -->
							<div>
								<label for="name"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Name</label> <input type="text" id="name" name="name"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.name }">
							</div>

							<!-- Price -->
							<div>
								<label for="price"
									class="block text-sm font-medium text-gray-700 mb-1">Price</label>
								<input type="text" id="price" name="price"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.price }">
							</div>

							<!-- Quantity -->
							<div>
								<label for="quantity"
									class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
								<input type="text" id="quantity" name="quantity"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.quantity }">
							</div>

							<!-- Discount -->
							<div class="md:col-span-2">
								<label for="discount"
									class="block text-sm font-medium text-gray-700 mb-1">Discount</label>
								<input type="text" id="discount" name="discount"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.discount }">
							</div>

							<!-- Product Image -->
							<div class="md:col-span-2">
								<label for="image"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Image</label> <input type="file" id="image" name="image"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.image }">
							</div>

							<!-- Tags -->
							<div>
								<label for="tags"
									class="block text-sm font-medium text-gray-700 mb-1">Product
									Tags</label> <input type="text" id="tags" name="tags"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									value="${edit_product.tags }">
							</div>

							<!-- Description -->
							<div class="md:col-span-2">
								<label for="description"
									class="block text-sm font-medium text-gray-700 mb-1">Description</label>
								<textarea id="description" name="description" rows="5"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out"
									>${edit_product.description}</textarea>
							</div>

							<!-- Category -->
							<div>
								<label for="category"
									class="block text-sm font-medium text-gray-700 mb-1">Category</label>
								<select id="category" name="category"
									class="w-full px-4 py-3 rounded-lg border border-gray-300  transition duration-150 ease-in-out">
									<option value="" selected disabled>Select your Category</option>
									<c:forEach items="${category_list }" var="cat">
										<option value="${cat.id }" <c:if test="${cat.id eq edit_product.category.id }"> selected </c:if>>${cat.name }</option>
									</c:forEach>
								</select>
							</div>

						</div>

						<!-- Submit Button -->
						<div class="mt-8">
							<button type="submit"
								class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-4 rounded-lg transition duration-150 ease-in-out shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
								Update Product</button>
						</div>


					</form>
				</div>
			</div>
				</c:otherwise>
			</c:choose>

			<h1>Show Product details</h1>
			<div>
				<div>
					<table class="w-full table-fixed">
						<thead>
							<tr class="bg-gray-100">
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Product
									Name</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Name</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Description</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Price</th>

								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Discount</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Quantity</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">ImageName</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Date</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">tags</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Product
									Category</th>

								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Edit</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Delete</th>
							</tr>
						</thead>
						<tbody class="bg-white">
							<!-- generate row for each category object in category list -->
							<c:forEach items="${product_list }" var="product">
								<tr>
									<td class="py-4 px-6 border-b border-gray-200">${product.id}</td>
									<td class="py-4 px-6 border-b border-gray-200 truncate">${product.name}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.description}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.price}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.discount}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.quantity}</td>
									
									<td class="py-4 px-6 border-b border-gray-200">
									<img src="${pageContext.request.contextPath }/${product.imageName}" height="100px" alt="image"></td>
									<td class="py-4 px-6 border-b border-gray-200">${product.addedDate}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.tags}</td>
									<td class="py-4 px-6 border-b border-gray-200">${product.category.name}</td>

									<td class="py-4 px-6 border-b border-gray-200"><a
										href="${pageContext.request.contextPath}/admin/product/edit/${product.id}">
											<span
											class="bg-green-500 text-white py-1 px-2 rounded-full text-xs">Edit</span>
									</a></td>

									<td class="py-4 px-6 border-b border-gray-200"><a
										href="${pageContext.request.contextPath}/admin/product/delete/${category.id}">
											<span
											class="bg-green-500 text-white py-1 px-2 rounded-full text-xs">Delete</span>
									</a></td>

								</tr>
							</c:forEach>



							<!-- Add more rows here -->
						</tbody>
					</table>

				</div>
			</div>

		</main>
	</div>

	<script>
        // Mobile menu functionality
        const mobileMenuButton = document.querySelector('.mobile-menu-button');
        const sidebar = document.querySelector('.sidebar');
        const overlay = document.querySelector('.overlay');

        function toggleMobileMenu() {
            sidebar.classList.toggle('translate-x-0');
            overlay.classList.toggle('hidden');
            setTimeout(() => overlay.classList.toggle('opacity-0'), 0);
            document.body.style.overflow = sidebar.classList.contains('translate-x-0') ? 'hidden' : '';
        }

        mobileMenuButton.addEventListener('click', toggleMobileMenu);
        overlay.addEventListener('click', toggleMobileMenu);

        // Close mobile menu on window resize if open
        window.addEventListener('resize', () => {
            if (window.innerWidth >= 1024 && sidebar.classList.contains('translate-x-0')) {
                toggleMobileMenu();
            }
        });

        // Notification animation
        const notificationIcon = document.querySelector('.material-icons-outlined:nth-child(2)');
        setInterval(() => {
            notificationIcon.classList.add('scale-110');
            setTimeout(() => notificationIcon.classList.remove('scale-110'), 200);
        }, 5000);
    </script>
</body>
</html>