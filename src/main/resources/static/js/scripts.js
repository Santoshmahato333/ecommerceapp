document.addEventListener("DOMContentLoaded", () => {
    const products = [
      { name: "Air Max Pro", category: "men",description:"Breathable,stylish, and perfect for everyday use", price: 120, images: "images/shoe1.avif" },
      { name: "Sky Runner", category: "women",description:"Breathable,stylish, and perfect for everyday use", price: 90, images: "images/shoe2.webp" },
      { name: "Nike Runner", category: "men",description:"Breathable,stylish, and perfect for everyday use", price: 110, images: "images/shoe3.webp" },
      {name:"Air Max Pro", category:"women",description:"Breathable,stylish, and perfect for everyday use", price: 120, images:"images/shoe4.webp"},
    ];
  
    const productList = document.getElementById("productList");
    const categoryFilter = document.getElementById("categoryFilter");
  
    function renderProducts(filter = "all") {
      productList.innerHTML = "";
      const filtered = filter === "all" ? products : products.filter(p => p.category === filter);
      filtered.forEach(p => {
        const card = document.createElement("div");
        card.className = "product-card";
        card.innerHTML = `
        <div class="product-image">
      <img src="${p.images}" alt="${p.name}" onerror="this.src='images/shoes2.webp'">
    </div>
    <div class="product-info">
      <h1>${p.name}</h1>
      <p class="price">Price:Rs${p.price}</p>
      <p class="description">${p.description}</p>
      <button class="btn">Add to Cart</button>
    </div>
        `;
        
        productList.appendChild(card);
      });
    }
  
    categoryFilter.addEventListener("change", (e) => {
      renderProducts(e.target.value);
    });
  
    renderProducts();
  });
  