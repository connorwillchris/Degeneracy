local ref = next
next = function(a, ...)
  if type(a) ~= "table" then
    return nil
  else
    return ref(a, ...)
  end
end

-- Rank definitions
local ranks = {

  { key = '-1', shorthand = '-1', card_key = '-1', pos = { x = 0 }, nominal = -1, next = { 'deg_0' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 0, y = 12 } } },
  { key = '-2', shorthand = '-2', card_key = '-2', pos = { x = 1 }, nominal = -2, next = { 'deg_-1' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 1, y = 12 } } },
  { key = '-3', shorthand = '-3', card_key = '-3', pos = { x = 2 }, nominal = -3, next = { 'deg_-2' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 2, y = 12 } } },
  { key = '-4', shorthand = '-4', card_key = '-4', pos = { x = 3 }, nominal = -4, next = { 'deg_-3' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 3, y = 12 } } },
  { key = '-5', shorthand = '-5', card_key = '-5', pos = { x = 4 }, nominal = -5, next = { 'deg_-4' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 4, y = 12 } } },
  { key = '-6', shorthand = '-6', card_key = '-6', pos = { x = 5 }, nominal = -6, next = { 'deg_-5' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 5, y = 12 } } },
  { key = '-7', shorthand = '-7', card_key = '-7', pos = { x = 6 }, nominal = -7, next = { 'deg_-6' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 6, y = 12 } } },
  { key = '-8', shorthand = '-8', card_key = '-8', pos = { x = 7 }, nominal = -8, next = { 'deg_-7' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 7, y = 12 } } },
  { key = '-9', shorthand = '-9', card_key = '-9', pos = { x = 8 }, nominal = -9, next = { 'deg_-8' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 8, y = 12 } } },

  { key = '-10', shorthand = '-10', card_key = '-T', pos = { x = 9 }, nominal = -10, next = { 'deg_-9' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 9, y = 12 } } },
  { key = '-Jack', shorthand = '-J', card_key = '-J', pos = { x = 10 }, nominal = -10, face = true, face_nominal = 0.1, next = { 'deg_-10' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 10, y = 12 } } },
  { key = '-Queen', shorthand = '-Q', card_key = '-Q', pos = { x = 11 }, nominal = -10, face = true, face_nominal = 0.2, next = { 'deg_-Jack' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 11, y = 12 } } },
  { key = '-King', shorthand = '-K', card_key = '-K', pos = { x = 12 }, nominal = -10, face = true, face_nominal = 0.3, next = { 'deg_-Queen' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 12, y = 12 } } },
  { key = '-Ace', shorthand = '-A', card_key = '-A', pos = { x = 13 }, nominal = -11, face_nominal = 0.4, next = { 'deg_-King' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 13, y = 12 } } },
  { key = '-11', shorthand = '-11', card_key = '-11', pos = { x = 14 }, nominal = -11, face_nominal = 0.4, next = { 'deg_-Ace' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 14, y = 12 } } },

  { key = '0', shorthand = '0', card_key = '0', pos = { x = 15 }, nominal = 0, next = { 'deg_1' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 15, y = 12 } } },
  { key = '0.5', shorthand = '0.5', card_key = '0.5', pos = { x = 16 }, nominal = 0.5, next = { 'deg_1' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 16, y = 12 } } },
  { key = '1', shorthand = '1', card_key = '1', pos = { x = 17 }, nominal = 1, next = { '2' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 17, y = 12 } } },
  { key = 'pi', shorthand = 'Pi', card_key = 'pi', pos = { x = 18 }, nominal = 3.141, next = { '4' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 18, y = 12 } } },
  { key = '11', shorthand = '11', card_key = '11', pos = { x = 19 }, nominal = 11, next = { 'deg_12' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 19, y = 12 } } },
  { key = '12', shorthand = '12', card_key = '12', pos = { x = 20 }, nominal = 12, next = { 'deg_13' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 20, y = 12 } } },
  { key = '13', shorthand = '13', card_key = '13', pos = { x = 21 }, nominal = 13, next = { 'deg_14' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 21, y = 12 } } },
  { key = '14', shorthand = '14', card_key = '14', pos = { x = 23 }, nominal = 14, next = { 'deg_15' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 23, y = 12 } } },
  { key = '15', shorthand = '15', card_key = '15', pos = { x = 24 }, nominal = 15, next = { 'deg_16' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 24, y = 12 } } },
  { key = '16', shorthand = '16', card_key = '16', pos = { x = 25 }, nominal = 16, next = { 'deg_17' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 25, y = 12 } } },
  { key = '17', shorthand = '17', card_key = '17', pos = { x = 26 }, nominal = 17, next = { 'deg_18' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 26, y = 12 } } },
  { key = '18', shorthand = '18', card_key = '18', pos = { x = 27 }, nominal = 18, next = { 'deg_19' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 27, y = 12 } } },
  { key = '19', shorthand = '19', card_key = '19', pos = { x = 28 }, nominal = 19, next = { 'deg_20' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 28, y = 12 } } },
  { key = '20', shorthand = '20', card_key = '20', pos = { x = 29 }, nominal = 20, next = { 'deg_21' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 29, y = 12 } } },
  { key = '21', shorthand = '21', card_key = '21', pos = { x = 22 }, nominal = 21, next = { 'deg_e' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 22, y = 12 } } },

  { key = 'e', shorthand = 'e', card_key = 'e', pos = { x = 30 }, nominal = 2.718, next = { 'deg_bace' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 30, y = 12 } } },
  { key = 'bace', shorthand = 'B', card_key = 'bace', pos = { x = 31 }, nominal = 22, straight_edge = true, next = { 'deg_bace' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_cards_lc', pos = { x = 31, y = 12 } } },
}

-- Create Ranks
for _, def in ipairs(ranks) do
  local rank = {
    in_pool = function(self, args)
      if args and args.suit == '' then
        return false
      end

      if args and args.initial_deck then
        local back = G.GAME.selected_back.effect.center
        if back and back.initial_deck and back.initial_deck.Ranks then
          for _, rank_key in ipairs(back.initial_deck.Ranks) do
            if rank_key == self.key then
              return true
            end
          end
        end
        return false
      end

      return false
    end,
    suit_map = {
      Hearts = 0,
      Clubs = 1,
      Diamonds = 2,
      Spades = 3,
      bunc_Fleurons = 4,
      bunc_Halberds = 5,
      paperback_Stars = 6,
      paperback_Crowns = 7,
      mtg_Clovers = 8,
      mtg_Suitless = 9,
      entr_nilsuit = 10,
      zero_Brights = 11,
      celestin_Vortexes = 13,
    },
    strength_effect = {
      fixed = 1,
      random = false,
      ignore = false
    },
    lc_atlas = 'cards_lc',
    hc_atlas = 'cards_hc',
    key = def.key,
    shorthand = def.shorthand,
    card_key = def.card_key,
    pos = def.pos,
    nominal = def.nominal,
    next = def.next,
  }

  if def.face then
    rank.face = def.face
  end
  if def.face_nominal then
    rank.face_nominal = def.face_nominal
  end
  if def.straight_edge then
    rank.straight_edge = def.straight_edge
  end
  if def.akyrs_pure_rank_atlas then
    rank.akyrs_pure_rank_atlas = def.akyrs_pure_rank_atlas
  end

  SMODS.Rank(rank)
end
