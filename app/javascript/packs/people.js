document.addEventListener("turbolinks:load", function () {
    $input = $("#tag-autocomplete")

    console.log("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")

    var options = {
        getValue: "full_name",
        url: function (phrase) {
            console.log(phrase)
            return "/search.json?search=" + phrase;
        },
        categories: [
            {
                listLocation: "cameras",
                header: "<strong>Cameras</strong>",
            }
        ],
        list: {
            onChooseEvent: function () {
                var url = $input.getSelectedItemData().url
                console.log(url)
                $input.val("")
                Turbolinks.visit(url)
            }
        }
    }

    var options_new = {
        url: function (phrase) {
            return "/search.json?search=" + phrase;
        },
        getValue: "name",

        // template: {
        //     type: "links",
        //     fields: {
        //         link: "link"
        //     }
        // },
    };


    var options_test = {
        data: ["John", "Paul", "George", "Ringo"]
    };

    $input.easyAutocomplete(options_new)
});