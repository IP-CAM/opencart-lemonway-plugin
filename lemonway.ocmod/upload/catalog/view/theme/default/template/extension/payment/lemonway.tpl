<div>
    <?php if ($lemonway_is_test_mode) { ?>
    <div class="alert alert-warning"><i class="fa fa-exclamation-triangle"></i> <?= $error_test_mode ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <h3 class="lemonway-method-title">
        <?= $text_card ?> <?= ($lemonway_is_test_mode) ? "(Test)" : "" ?>
    </h3>
    <div>
        <form action="<?= $link_checkout ?>" method="POST">
            <?php
            if ($lemonway_oneclick_enabled && $customerId) { // Hide One-click form from guest
                if ($card) { // User already have a saved card. He can choose to use it or not
            ?>
            <div>
                <div class="radio">
                    <label>
                        <input type="radio" class="hide_cards" name="lemonway_oneclick" value="use_card" checked />
                        <?= $text_use_card ?> (<em><?= $card['card_num'] ?></em> - <em><?= $card['card_exp'] ?></em>)
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" class="show_cards" name="lemonway_oneclick" value="register_card" />
                        <?= $text_save_new_card ?>
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" class="show_cards" name="lemonway_oneclick" value="no_use_card" />
                        <?= $text_not_use_card ?>
                    </label>
                </div>
            </div>
            <?php
                }
            }
            ?>

            <!-- Choose a card type -->
            <!-- If the user choose to use a saved card, he doesn't need to choose a card type -->
            <div id="card_choosing_container" style="<?= ($lemonway_oneclick_enabled && $customerId && $card) ? 'display: none' : '' ?>">
                <div class="row">
                    <div class="col-md-1 text-center">
                        <label>
                            <img class="img-responsive" alt="CB" src="catalog/view/theme/default/image/lemonway_cb.gif">
                            <input type="radio" name="cc_type" value="CB" checked />
                        </label>
                    </div>
                    <div class="col-md-1 text-center">
                        <label>
                            <img class="img-responsive" alt="Visa" src="catalog/view/theme/default/image/lemonway_visa.gif">
                            <input type="radio" name="cc_type" value="VISA" />
                        </label>
                    </div>
                    <div class="col-md-1 text-center">
                        <label>
                            <img class="img-responsive" alt="MasterCard" src="catalog/view/theme/default/image/lemonway_mastercard.gif">
                            <input type="radio" name="cc_type" value="MASTERCARD" />
                        </label>
                    </div>
                </div>
            </div>

            <div class="buttons">
                <div class="pull-right">
                    <?php
                    if ($lemonway_oneclick_enabled && $customerId) { // Hide One-click form from guest
                        if (!$card) { // If no saved card => Ask to save the card
                    ?>
                    <!-- User can choose to save his card -->
                    <label>
                        <?= $text_save_card ?>
                        <input type="checkbox" name="lemonway_oneclick" value="register_card" />
                    </label>
                    <?php
                        }
                    }
                    ?>
                    <button type="submit" data-toggle="tooltip" class="btn btn-primary" data-loading-text="<?= $text_loading ?>">
                        <?= $button_continue ?>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    $(function()
    {   
        // If using a saved card, hide the card choices
        $(".hide_cards").click(function()
        {
            $('#card_choosing_container').hide(300);
        });

        // If not using a saved card, show the card choices
        $(".show_cards").click(function()
        {
            $('#card_choosing_container').show(300);
        })
    });
</script>