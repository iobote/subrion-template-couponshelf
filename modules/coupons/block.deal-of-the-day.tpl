{if $coupon_blocks.oftheday}
    <div class="coupon -v -deal">
        <div class="coupon__img">
            {if $coupon_blocks.oftheday.gallery}
                <a href="{ia_url type='url' item='coupons' data=$coupon_blocks.oftheday}">
                    {ia_image file=$coupon_blocks.oftheday.gallery[0] type='thumbnail' alt="{$coupon_blocks.oftheday.shop_title|escape}"}
                </a>
            {elseif $coupon_blocks.oftheday.shop_image}
                <a href="{$smarty.const.IA_URL}shop/{$coupon_blocks.oftheday.shop_alias}.html">
                    {ia_image file=$coupon_blocks.oftheday.shop_image type='thumbnail' alt="{$coupon_blocks.oftheday.shop_title|escape}" class='img-responsive'}
                </a>
            {else}
                <a href="{$smarty.const.IA_URL}shop/{$coupon_blocks.oftheday.shop_alias}.html">
                    <img src="http://free.pagepeeker.com/v2/thumbs.php?size=m&url={$coupon_blocks.oftheday.shop_website|escape:url}" alt="Generated by pageppeker.com" class="img-responsive">
                </a>
            {/if}
        </div>

        <div class="coupon__body">
            <div class="coupon__title">
                {ia_url type='link' item='coupons' data=$coupon_blocks.oftheday text=$coupon_blocks.oftheday.title}
            </div>
            <div class="coupon__shop">
                <a href="{$smarty.const.IA_URL}shop/{$coupon_blocks.oftheday.shop_alias}.html">{$coupon_blocks.oftheday.shop_title}</a>
                {if $coupon_blocks.oftheday.category_parent_id > 0 && !empty($category) && $category.parent_id > 1}
                    / <a href="{$core.packages.coupons.url}{$coupon_blocks.oftheday.category_alias}/">{$coupon_blocks.oftheday.category_title}</a>
                {/if}
            </div>
        </div>

        <div class="coupon__price">
            <div class="coupon__price-wrp">
                <div class="coupon__actions">
                    {printFavorites item=$coupon_blocks.oftheday itemtype='coupons' guests=true}
                    {accountActions item=$coupon_blocks.oftheday itemtype='coupons'}
                </div>

                {if $coupon_blocks.oftheday.expire_date != 0}
                    <div class="coupon__time-left js-countdown" data-countdown="{$coupon_blocks.oftheday.expire_date}"></div>
                {/if}

                <div class="coupon__price-price">
                    <span class="coupon__price-price__current">{$core.config.coupon_item_price_currency}{$coupon_blocks.oftheday.discounted_price}</span>
                    <span class="coupon__price-price__old">{$core.config.coupon_item_price_currency}{$coupon_blocks.oftheday.item_price}</span>
                    <span class="coupon__price-price__save">You save: {$core.config.coupon_item_price_currency}{$coupon_blocks.oftheday.discount_saving}</span>
                </div>

                <a href="{ia_url type='url' item='coupons' data=$coupon_blocks.oftheday}" class="btn-coupon btn-coupon-link"><span class="fa fa-shopping-cart"></span> {lang key='get_deal'}</a>
            </div>
        </div>
    </div>
{/if}