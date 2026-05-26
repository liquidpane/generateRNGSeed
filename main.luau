--!strict
--!native

const HttpService = game:GetService("HttpService")

const band = bit32.band
const bxor = bit32.bxor
const brshift = bit32.rshift

return function()
	local s = band(
		bxor(
			bxor(os.time() * 0x9e3779b9, math.floor(os.clock() * 1000000)),

			bxor(
				math.random() * 0xFFFFFFFF,

				tonumber(
					HttpService:GenerateGUID(false):gsub("%D", ""):sub(1, 10)
				) or 0
			)
		),

		0xFFFFFFFF
	)

	s = band(s + 0x9e3779b9, 0xFFFFFFFF)

	local z = bxor(s, brshift(s, 16))
	z = band(z * 0x85ebca6b, 0xFFFFFFFF)
	z = bxor(z, brshift(z, 13))
	z = band(z * 0xc2b2ae35, 0xFFFFFFFF)
	z = bxor(z, brshift(z, 16))

	return z
end
