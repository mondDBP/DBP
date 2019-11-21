 $(function () {
            $(".outbutton").on("click", function () {
                var input = $(this).prev().text();
                $(this).parent().parent().next().find("input").attr("value", input);
                $(this).parent().parent().next().toggle();
                $(this).parent().parent().toggle();
            });
            $(".inbutton").on("click", function () {
                var input = $(this).prev().val();
                $(this).parent().parent().prev().find("b").html(input);
                $(this).parent().parent().prev().toggle();
                $(this).parent().parent().toggle();
            });
            $("#update-address").on("click", function () {
                $("#out-address-border").toggle();
                $("#in-address-border").toggle();
            });
            $("#save-address").on("click", function () {
                var input = $("#postcode").val()+$("#address").val()+$("#detailAddress").val();
                $("#out-address-border").toggle();
                $("#in-address-border").toggle();
                $("#out-address-border").find("b").html(input);
            });
        });


