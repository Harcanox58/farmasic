select `ol`.`id_order_line` AS `id_order_line`,`ol`.`id_order` AS `id_order`,`ol`.`id_product` AS `id_product`,`p`.`name` AS `name`,`ol`.`quantity` AS `quantity`,case when `ol`.`discount_percentage` is null then 0 else `ol`.`discount_percentage` end AS `discount_percentage`,`ol`.`tax_rate` AS `tax_rate`,`p`.`code` AS `code`,(select sum(`fs_stock`.`current_stock`) from `fs_stock` where `fs_stock`.`id_product` = `ol`.`id_product`) AS `current_stock`,`ol`.`price` AS `price`,`ol`.`price_usd` AS `price_usd`,case when `ol`.`discount_percentage` is not null then round(`ol`.`price` - `ol`.`price` * (`ol`.`discount_percentage` / 100) + `ol`.`price` * (`ol`.`tax_rate` / 100),2) end AS `net_price`,case when `ol`.`discount_percentage` is not null then round(`ol`.`price_usd` - `ol`.`price_usd` * (`ol`.`discount_percentage` / 100) + `ol`.`price_usd` * (`ol`.`tax_rate` / 100),2) end AS `net_price_usd`,`ol`.`total` AS `total`,`ol`.`total_usd` AS `total_usd` from (`fs_order_lines` `ol` join `fs_products` `p` on(`p`.`id_product` = `ol`.`id_product`)) order by `ol`.`id_order_line`