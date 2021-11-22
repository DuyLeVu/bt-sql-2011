use demo20062;
# Mức 1:
# 1.	In ra các sản phẩm có số lượng từ 30 trở lên.
select product.name, product.quantity
from product
where quantity >= 30;
# 2.	In ra các sản phẩm có số lượng từ 30 trở lên và có giá trong khoảng 100 đến 200.
select product.name, product.quantity, product.price
from product
where quantity >= 30 and price <= 200 and price >= 100;
# 3.	In ra thông tin khách hàng tuổi lớn hơn 18
select customer.name, customer.age
from customer
where age > 18;
# 4.	In ra thông tin khách hàng họ Nguyễn và lớn hơn 20 tuổi
select customer.name, customer.age
from customer
where age > 20 and name like 'nguyễn%';
# 5.	In ra sản phẩm tên bắt đầu bằng chữ M
select product.name, product.price, product.quantity
from product
where name like 'M%';
# 6.	In ra sản phẩm kết thức bằng chữ E
select product.name, product.price, product.quantity
from product
where name like '%E';
# 7.	In ra danh sách sản phẩm số lượng tăng dần
select product.name, product.price, product.quantity
from product
order by product.quantity;
# 8.	In ra danh sách sản phẩm giá giảm dần
select product.name, product.price, product.quantity
from product
order by product.quantity desc;
# Mức 2:
# 1.	In ra tổng số lượng sản phẩm giá nhỏ hơn 300
select count(product.Id) as 'SL SP có giá < 300'
from product
where product.price < 300;
# 2.	In tổng số sản phẩm theo từng giá
select product.price, count(product.price) as 'SL SP'
from product
group by price;
# 3.	In ra sản phẩm có giá cao nhất
select  *
from product
where price = (select max(price) from product);
# 4.	In ra giá trung bình của tất cả các sản phẩm
select avg(price) as 'Giá trung bình'
from product;
# 5.	In ra tổng số tiền nếu bán hết tất cả sản phẩm.
SELECT SUM(product.price*product.quantity) as 'Total'
FROM product;
# 6.	Tính tổng số sản phẩm giá <300.
select sum(product.quantity) as 'Tổng số sản phẩm giá <300'
from product
where product.price < 300;
# 7.	Tìm giá bán cao nhất của các sản phẩm bắt đầu bằng chữ M.
select max(price) as 'giá bán cao nhất của các sản phẩm bắt đầu bằng chữ M'
from product
where product.name like 'M%';
# 8.	Thấp nhất của các sản phẩm bắt đầu bằng chữ M.
select min(price) as 'giá bán thấp nhất của các sản phẩm bắt đầu bằng chữ M'
from product
where product.name like 'M%';
# 9.	Trung bình của các sản phẩm bắt đầu bằng chữ M.
select avg(price) as 'giá trung bình của các sản phẩm bắt đầu bằng chữ M'
from product
where product.name like 'M%';
# Mức 3:
# 1.	In ra tên khách hàng và thời gian mua hàng.
select customer.name, `order`.time
from customer join `order`  on customer.id = `order`.customerId;
# 2.	In ra tên khách hàng và tên sản phẩm đã mua
select customer.name, p.name
from customer join `order`  on customer.id = `order`.customerId
    join orderdetail o on `order`.id = o.orderId
join product p on o.productId = p.id;
# 3.	In ra mã hoá đơn và giá trị hoá đơn
select orderdetail.orderid, product.price * orderdetail.quantity as 'Giá trị hóa đơn'
from orderdetail join product on orderdetail.productId = product.id
group by orderid, product.price * orderdetail.quantity;
# 4.	In ra mã hoá đơn và giá trị hoá đơn giảm dần
select orderdetail.orderid, product.price * orderdetail.quantity as 'Giá trị hóa đơn'
from orderdetail join product on orderdetail.productId = product.id
group by orderid, product.price * orderdetail.quantity
order by product.price * orderdetail.quantity desc ;
# Mức 4-10 :
# 1.	In ra các mã hóa đơn, trị giá hóa đơn bán ra trong ngày 19/6/2006 và ngày 20/6/2006.
# 2.	In ra các mã hóa đơn, trị giá hóa đơn trong tháng 6/2006, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
# 3.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 19/06/2007.
# 4.	In ra danh sách các sản phẩm (MASP, TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
# 5.	Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”.
# 6.	In ra danh sách các sản phẩm (MASP, TENSP) không bán được.
# 7.	In ra danh sách các sản phẩm (MASP, TENSP) không bán được trong năm 2006.
# 8.	In ra danh sách các sản phẩm (MASP, TENSP) có giá >300 sản xuất bán được trong năm 2006.
# 9.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
# 10.	Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
# 11.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm “Máy giặt” và “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
# 12.	Tìm số hóa đơn đã mua tất cả các sản phẩm có giá >200.
# 13.	Tìm số hóa đơn trong năm 2006 đã mua tất cả các sản phẩm có giá <300.
# 14.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
# 15.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
# 16.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
# 17.	Tính doanh thu bán hàng trong năm 2006.
# 18.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
# 19.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
# 20.	In ra danh sách 3 khách hàng (MAKH, HOTEN) mua nhiều hàng nhất (tính theo số lượng).
# 21.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
# 22.	In ra danh sách các sản phẩm (MASP, TENSP) có tên bắt đầu bằng chữ M, có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
# 23.	Tính doanh thu bán hàng mỗi ngày.
# 24.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
# 25.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
# 26.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
# 27.	Tìm hóa đơn có mua 3 sản phẩm có giá <300 (3 sản phẩm khác nhau).
# 28.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
# 29.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
# 30.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
# 31.	Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
#
