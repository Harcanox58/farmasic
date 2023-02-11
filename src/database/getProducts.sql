SELECT
	p.id_product,
	p.`name`,
	p.description,
	p.`code`,
	p.bar_code,
	b.`name` AS brand,
	p.price,
	p.price_usd,
	p.img_name,
	s.current_stock,
	t.rate,
	c.`name` AS category,
	a.`name` AS active,
	d.percentage,
	d.amount,
	d.amount_usd
FROM
	fs_products AS p,
	fs_brands AS b,
	fs_stock AS s,
	fs_categories AS c,
	fs_taxes AS t,
	fs_active_compounds AS a,
	fs_discounts as d
WHERE
	b.id_brand = p.id_brand 
	AND p.id_product = s.id_product 
	AND p.id_tax = t.id_tax 
	AND p.id_active_compound = a.id_active_compound 
	AND p.id_category = c.id_category
	AND p.id_discount=d.id_discount
	AND a.is_sicotropico='1'