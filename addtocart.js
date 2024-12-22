const form = document.createElement("form");
form.method = "POST";
form.action = "ccartpay.jsp";
form.id = "Mpay";
document.body.appendChild(form);

const product = [
    {
        id: 1,
        image: 'img/gad1.jpg',
        title: 'Milton Steel Bottle',
        price: 265,
    },
    {
        id: 2,
        image: 'img/gad2.jpeg',
        title: 'Milton Copper Bottle',
        price: 370,
    },
    {
        id: 3,
        image: 'img/gad3.jpeg',
        title: 'Milton Hand-On Metal Bottle',
        price: 350,
    },
    {
        id: 4,
        image: 'img/gad4.jpeg',
        title: 'Nalgine Steel Water Bottle',
        price: 290,
    },
    {
        id: 5,
        image: 'img/gad5.jpeg',
        title: 'Owala Freesip Metal water bottle',
        price: 365,
    },
    {
        id: 6,
        image: 'img/gad6.jpg',
        title: 'Camel-Bak Steel Water Bottle',
        price: 265,
    },
    {
        id: 7,
        image: 'img/gad7.jpeg',
        title: 'YETI rambler plastic Water Bottle',
        price: 165,
    },
    {
        id: 8,
        image: 'img/gad8.jpeg',
        title: 'Contigo Water Bottle',
        price: 100,
    },
    {
        id: 9,
        image: 'img/gad9.jpg',
        title: 'EnOcean Blue Steel WaterBottle',
        price: 315,
    },
    {
        id: 10,
        image: 'img/gad10.jpeg',
        title: 'Aquafine Steel Water Bottle',
        price: 125,
    },
    {
        id: 11,
        image: 'img/gad11.jpg',
        title: 'Triangle Stealth',
        price: 105,
    },
    {
        id: 12,
        image: 'img/gad12.jpg',
        title: 'Dasani Steel Water Bottle',
        price: 375,
    }
];

let cart = [];

function addtocart(index) {
    const selectedItem = { ...product[index] };
    cart.push(selectedItem);
    displaycart();
}

function delElement(index) {
    cart.splice(index, 1);
    displaycart();
}

function Alert() {
    document.getElementById('Mpay').submit();
}

function displaycart() {
    let total = 0;
    const cartContainer = document.getElementById('cartItem');
    const countElement = document.getElementById("count");
    const totalElement = document.getElementById("total");

    if (cart.length === 0) {
        cartContainer.innerHTML = "Your Cart is Empty";
        totalElement.innerHTML = "₹ " + 0 + ".00";
    } else {
        cartContainer.innerHTML = cart.map((item, index) => {
            const { image, title, price } = item;
            total += price;
            totalElement.innerHTML = "₹ " + total + ".00";

            return (
                `<div class='cart-item'>
                    <div class='row-img'>
                        <img class='rowimg' src="${image}"/>
                    </div>
                    <p style='font-size: 12px;'>${title}</p>
                    <h2 style='font-size: 15px;'>₹ ${price}.00</h2>
                    <i class='fas fa-trash' onclick='delElement(${index})'></i>
                </div>`
            );
        }).join('');
    }

    countElement.innerHTML = cart.length;

    // Clear form inputs before adding new ones
    form.innerHTML = '';
    let inputId,inputSrc,inputTitle,inputPrice;
    // Add hidden inputs for each item in the cart
    cart.forEach((item, index) => {
        const { id, image, title, price } = item;

        inputId = document.createElement("input");
        inputId.type = "hidden";
        inputId.name = "pid" ;
        inputId.value = id;

        inputSrc = document.createElement("input");
        inputSrc.type = "hidden";
        inputSrc.name = "src" ;
        inputSrc.value = image;

        inputTitle = document.createElement("input");
        inputTitle.type = "hidden";
        inputTitle.name = "name" ;
        inputTitle.value = title;

        inputPrice = document.createElement("input");
        inputPrice.type = "hidden";
        inputPrice.name = "price" ;
        inputPrice.value = price;

        form.appendChild(inputId);
        form.appendChild(inputSrc);
        form.appendChild(inputTitle);
        form.appendChild(inputPrice);
    });
}

// Initial display of products
document.getElementById('root').innerHTML = product.map((item, index) => {
    const { image, title, price } = item;

    return (
        `<div class='box'>
            <div class='img-box'>
                <img class='images' style='align-items:center;' src="${image}"/>
            </div>
            <div class='bottom'>
                <p>${title}</p>
                <h2>₹ ${price}.00</h2>
                <button onclick="addtocart(${index})">Add to Cart</button>
            </div>
        </div>`
    );
}).join('');
