// =========================
// OP1: insertMany()
// =========================
db.products.insertMany([
  {
    product_id: "E101",
    name: "Smartphone X",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      battery: "5000mAh",
    },
    features: ["5G", "AMOLED Display", "Fast Charging"],
  },
  {
    product_id: "C101",
    name: "Men's T-Shirt",
    category: "Clothing",
    price: 799,
    brand: "Nike",
    size_options: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Black", "White", "Blue"],
  },
  {
    product_id: "G101",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "7g",
    },
    storage: "Refrigerated",
  },
]);

// =========================
// OP2: find Electronics price > 20000
// =========================
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 },
});

// =========================
// OP3: find Groceries expiring before 2025-01-01
// =========================
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") },
});

// =========================
// OP4: updateOne() add discount_percent
// =========================
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } },
);

// =========================
// OP5: createIndex() on category
// =========================
db.products.createIndex({ category: 1 });

// Reason:
// Improves query performance when filtering by category,
// especially for large datasets.
