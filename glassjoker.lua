SMODS.Joker {
    key = "Glassjoker",
    atlas = "Glassjoker",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    cost = 6,
    discovered = true,
    config = { extra = {} },
    loc_txt = {
        name = "Glass Joker",
        text = {
            "Glass cards do not",
            "break when played"
        }
    },

    
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.card and context.card.ability.set == "Glass" then
            return {
                message = "Unbreakable!",
                colour = G.C.BLUE,
                remove_break = true
            }
        end
    end
}

SMODS.Back{
    name = "Absolute Deck",
    key = "absolute",
    pos = {x = 0, y = 3},
    config = {polyglass = true},
    loc_txt = {
        name = "Absolute Deck",
        text ={
            "Start with a Deck",
            "full of {C:attention,T:e_polychrome}Poly{}{C:red,T:m_glass}glass{} cards"
        },
    },
    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:set_ability(G.P_CENTERS.m_glass)
                    G.playing_cards[i]:set_edition({
                        polychrome = true
                    }, true, true)
                end
                return true
            end
        }))
    end
}
