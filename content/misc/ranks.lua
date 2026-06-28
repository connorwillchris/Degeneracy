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

  { key = '-1', shorthand = '-1', card_key = '-1', pos = { x = 0 }, nominal = -1, next = { 'deg_0' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 0, y = 0 } } },

  { key = '-10', shorthand = '-10', card_key = '-T', pos = { x = 9 }, nominal = -10, next = { 'deg_-9' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 9, y = 0 } } },
  { key = '-Jack', shorthand = '-J', card_key = '-J', pos = { x = 10 }, nominal = -10, face = true, face_nominal = 0.1, next = { 'deg_-10' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 10, y = 0 } } },
  { key = '-Queen', shorthand = '-Q', card_key = '-Q', pos = { x = 11 }, nominal = -10, face = true, face_nominal = 0.2, next = { 'deg_-Jack' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 11, y = 0 } } },
  { key = '-King', shorthand = '-K', card_key = '-K', pos = { x = 12 }, nominal = -10, face = true, face_nominal = 0.3, next = { 'deg_-Queen' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 12, y = 0 } } },
  { key = '-Ace', shorthand = '-A', card_key = '-A', pos = { x = 13 }, nominal = -11, face_nominal = 0.4, next = { 'deg_-King' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 13, y = 0 } } },
  { key = '-11', shorthand = '-11', card_key = '-11', pos = { x = 14 }, nominal = -11, face_nominal = 0.4, next = { 'deg_-Ace' }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = 14, y = 0 } } },

  { key = '0', shorthand = '0', card_key = '0', pos = { x = 15 }, nominal = 0, next = { 'deg_1' } },
  { key = '0.5', shorthand = '0.5', card_key = '0.5', pos = { x = 16 }, nominal = 0.5, next = { 'deg_1' } },
  { key = '1', shorthand = '1', card_key = '1', pos = { x = 17 }, nominal = 1, next = { '2' } },
  { key = 'pi', shorthand = 'Pi', card_key = 'pi', pos = { x = 18 }, nominal = 3.141, next = { '4' } },
  { key = '11', shorthand = '11', card_key = '11', pos = { x = 19 }, nominal = 11, next = { 'deg_12' } },
  { key = '12', shorthand = '12', card_key = '12', pos = { x = 20 }, nominal = 12, next = { 'deg_13' } },
  { key = '13', shorthand = '13', card_key = '13', pos = { x = 21 }, nominal = 13, next = { 'deg_14' } },
  { key = '14', shorthand = '14', card_key = '14', pos = { x = 23 }, nominal = 14, next = { 'deg_15' } },
  { key = '15', shorthand = '15', card_key = '15', pos = { x = 24 }, nominal = 15, next = { 'deg_16' } },
  { key = '16', shorthand = '16', card_key = '16', pos = { x = 25 }, nominal = 16, next = { 'deg_17' } },
  { key = '17', shorthand = '17', card_key = '17', pos = { x = 26 }, nominal = 17, next = { 'deg_18' } },
  { key = '18', shorthand = '18', card_key = '18', pos = { x = 27 }, nominal = 18, next = { 'deg_19' } },
  { key = '19', shorthand = '19', card_key = '19', pos = { x = 28 }, nominal = 19, next = { 'deg_20' } },
  { key = '20', shorthand = '20', card_key = '20', pos = { x = 29 }, nominal = 20, next = { 'deg_21' } },
  { key = '21', shorthand = '21', card_key = '21', pos = { x = 22 }, nominal = 21, next = { 'deg_e' } },
  { key = 'e', shorthand = 'e', card_key = 'e', pos = { x = 29 }, nominal = 2.718, next = { 'deg_bace' } },
  { key = 'bace', shorthand = 'B', card_key = 'bace', pos = { x = 31 }, nominal = 22, straight_edge = true, next = { 'deg_bace' } },
}

-- Add -2 to -9 to the array
for _, v in ipairs({ -2, -3, -4, -5, -6, -7, -8, -9 }) do
  ranks[#ranks + 1] = {
    key = tostring(v), shorthand = tostring(v), card_key = tostring(v), pos = { x = (v * -1) - 1 }, nominal = v, next = { 'deg_' .. tostring(v + 1) }, akyrs_pure_rank_atlas = { atlas_key = 'deg_pure_ranks', pos = { x = (v * -1) - 1, y = 0 } }
  }
end

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
