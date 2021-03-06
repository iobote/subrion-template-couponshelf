{if !empty($pay_message)}
    <div class="alert alert-warning">{$pay_message}</div>
{elseif !empty($transaction) && is_array($transaction)}
    <div class="fieldset">
        <div class="fieldset__content">
            <table class="table table-striped table-bordered m-a-0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>{lang key='pay_reason'}</th>
                    <th>{lang key='item'}</th>
                    <th>{lang key='total'}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{$transaction.item_id}</td>
                    <td>{$transaction.operation}</td>
                    <td>{lang key=$transaction.item}</td>
                    <td>{$transaction.amount}&nbsp;{$core.config.currency}</td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>

    <form method="post" id="payment_form" class="ia-form">
        {preventCsrf}
        <div class="fieldset">
            <div class="fieldset__header">{lang key='billing_address'}</div>
            <div class="fieldset__content">
                <div class="form-group">
                    <label class="control-label">{lang key='address_line'} 1:</label>
                    <input class="form-control" type="text" name="invaddr[address1]" value="{$address.address1|escape}">
                </div>

                <div class="form-group">
                    <label class="control-label">{lang key='address_line'} 2:</label>
                    <input class="form-control" type="text" name="invaddr[address2]" value="{$address.address2|escape}">
                </div>

                <div class="form-group">
                    <label class="control-label">{lang key='zip'}:</label>
                    <input class="form-control" type="text" name="invaddr[zip]" maxlength="12" value="{$address.zip|escape}">
                </div>

                <div class="form-group">
                    <label class="control-label">{lang key='country'}:</label>
                    <input class="form-control" type="text" name="invaddr[country]" maxlength="32" value="{$address.country|escape}">
                </div>
            </div>
        </div>

        <div class="fieldset">
            <div class="fieldset__content">
                <div class="plans">
                    {if $member && !$isBalancePayment}
                        <div class="plans__item">
                            <label class="plans__item__header radio">
                                <input type="radio" name="source" value="internal"{if $isFundsEnough} checked{else} disabled{/if}>
                                <strong>{lang key='pay_using_account_funds'}</strong>
                            </label>
                            <div class="plans__item__body">{lang key='funds_in_your_account'}</div>
                        </div>
                    {/if}

                    <div class="plans__item">
                        <label class="plans__item__header radio">
                            <input type="radio" name="source" value="external"{if !$isFundsEnough && $gateways} checked{elseif !$gateways} disabled{/if}>
                            <strong>{lang key='pay_external'}</strong>
                        </label>
                        <div class="plans__item__body">{lang key='pay_via_payment_gateways'}</div>

                        {if $gateways}
                            <div id="gw_wrap" class="gw-list">
                                {ia_hooker name='paymentButtons'}
                            </div>
                        {elseif $member && iaUsers::MEMBERSHIP_ADMINISTRATOR == $member.usergroup_id}
                            <div class="alert alert-warning">{lang key='no_gateway'}</div>
                        {/if}
                    </div>
                </div>
            </div>

            <div class="fieldset__actions">
                <button type="submit" class="btn btn-primary"{if !$gateways && !$isFundsEnough} disabled="disabled"{/if}>{lang key='proceed_pay'}</button>
            </div>
        </div>
    </form>

    {ia_print_js files='frontend/pay'}
{/if}