SMODS.Joker {
    key = "memory_card",

    loc_vars = function(self, info_queue, card)
        local list = {}

        if card.ability.extra.saved then
            local area = CardArea(0, 0, 2, 1.5, { type = 'title', card_limit = 1 })

            local desc_card = SMODS.create_card({ set = card.ability.extra.saved.ability.set, skip_materialize = true })
            desc_card:load(card.ability.extra.saved)
            desc_card:hard_set_T()

            desc_card.T.w = G.CARD_W * 0.5
            desc_card.T.h = G.CARD_H * 0.5
            area:emplace(desc_card)
            desc_card.facing = 'front'
            desc_card:juice_up(0.1, 0.1)

            list = { {
                n = G.UIT.O,
                config = {
                    object = area
                }
            } }
        end
        return {
            vars = {},
            main_end = list
        }
    end,

    rarity = 3,
    cost = 7,
    atlas = 'deg_jokers',
    pos = { x = 7, y = 0 },

    config = {
        extra = {
            saved = nil
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and
            context.beat_boss and card.ability.extra.saved then
            local card_copied = SMODS.create_card({ set = card.ability.extra.saved.ability.set })
            card_copied:load(card.ability.extra.saved)

            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            card_copied:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, card_copied)
            G.deck:emplace(card_copied)
            card_copied.states.visible = nil

            SMODS.calculate_effect({ message = "Copied!", colour = G.C.FILTER }, card)
            card.ability.extra.saved = nil
        end
    end,
}

DEG.Button("j_deg_memory_card", {
    text = "SAVE",
    can_click = function(e)
        return G.hand and #G.hand.highlighted == 1
    end,
    ui_config = {
        align = 'cl',
        offset = { x = 0.2, y = 0 },
    },
    click = function(e)
        local card = e.config and e.config.ref_table
        card.ability.extra.saved = G.hand.highlighted[1]:save()
        SMODS.calculate_effect({ message = "Saved!", colour = G.C.FILTER }, card)
    end
})
