<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Dashboard</title>
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
		
		<c:choose>
		<c:when test="${edit ne true }">
		<form action="${pageContext.request.contextPath}/admin/category/add"
				method="post"
				class="max-w-md mx-auto mt-20 p-6 bg-white border rounded-lg shadow-lg">

				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<h2 class="text-2xl font-bold mb-6">New category form</h2>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="name">
						Name: </label> <input
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="name" type="text" name="name" placeholder="Enter your name">
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="feedback">
						Description </label>
					<textarea
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="feedback" rows="5" name="description"
						placeholder="Enter your description"></textarea>
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="email">
						parent Category: </label> <select
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="parentCat" name="parent_cat">
						<option value="0">main Category</option>
						<c:forEach items="${category_list }" var="cat">
						<option value="${cat.id }">${cat.name }</option>
						</c:forEach>
					</select>

				</div>

				<button
					class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
					type="submit">Submit</button>
			</form>
		
		</c:when>
		<c:otherwise>
		<form action="${pageContext.request.contextPath}/admin/category/update"
				method="post"
				class="max-w-md mx-auto mt-20 p-6 bg-white border rounded-lg shadow-lg">

				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<h2 class="text-2xl font-bold mb-6">Update category form</h2>
				
								<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="id">
						category id: </label> <input
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="id" type="text" name="id" value="${edit_cat.id }">
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="name">
						Name: </label> <input
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="name" type="text" name="name" value="${edit_cat.name }">
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="feedback">
						Description </label>
					<textarea
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="feedback" rows="5" name="description">${edit_cat.description }</textarea>
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="email">
						parent Category: </label> <select
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						id="parentCat" name="parentCat">
						<option value="0">main Category</option>
						<c:forEach items="${category_list }" var="cat">
						<option value="${cat.id }" <c:if test="${cat.id eq edit_cat.parentCat }"> selected </c:if>>${cat.name }</option>
						<!-- <option value="${cat.id }"${edit_cat.parentCat eq cat.id? "selected":"" } -->
						</c:forEach>
					</select>

				</div>

				<button
					class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
					type="submit">Submit</button>
			</form>
		
		</c:otherwise>
		
		</c:choose>
		
		
			

			<div>
				<div class="shadow-lg rounded-lg overflow-hidden mx-4 md:mx-10">
					<table class="w-full table-fixed">
						<thead>
							<tr class="bg-gray-100">
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Category
									Name</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Name</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Description</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Parent</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Edit</th>
								<th
									class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Delete</th>
							</tr>
						</thead>
						<tbody class="bg-white">
							<!-- generate row for each category object in category list -->
							<c:forEach items="${category_list }" var="category">
							<tr>
								<td class="py-4 px-6 border-b border-gray-200">${category.id}</td>
								<td class="py-4 px-6 border-b border-gray-200 truncate">${category.name}</td>
								<td class="py-4 px-6 border-b border-gray-200">${category.description}</td>
								<td class="py-4 px-6 border-b border-gray-200">${category.parentCat}</td>

								<td class="py-4 px-6 border-b border-gray-200"><a
									href="${pageContext.request.contextPath}/admin/category/edit/${category.id}">
										<span
										class="bg-green-500 text-white py-1 px-2 rounded-full text-xs">Edit</span>
								</a></td>

								<td class="py-4 px-6 border-b border-gray-200"><a
									href="${pageContext.request.contextPath}/admin/category/delete/${category.id}">
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
		<span>Copyright &copy;</span>
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