/obj/structure/closet/crate/med_crate/trauma
	name = "\improper Trauma crate"
	desc = "A crate with trauma equipment."
	closet_appearance = /decl/closet_appearance/crate/medical/trauma

/obj/structure/closet/crate/med_crate/trauma/WillContain()
	return list(
		/obj/item/stack/medical/splint = 2,
		/obj/item/stack/medical/bandage/advanced = 10,
		/obj/item/chems/pill/sugariron = 6,
		/obj/item/pill_bottle/painkillers,
		/obj/item/pill_bottle/strong_painkillers,
		/obj/item/pill_bottle/stabilizer
		)

/obj/structure/closet/crate/med_crate/burn
	name = "\improper Burn crate"
	desc = "A crate with burn equipment."
	closet_appearance = /decl/closet_appearance/crate/medical

/obj/structure/closet/crate/med_crate/burn/WillContain()
	return list(
		/obj/item/defibrillator/loaded,
		/obj/item/stack/medical/ointment/advanced = 10,
		/obj/item/pill_bottle/burn_meds,
		/obj/item/pill_bottle/painkillers,
		/obj/item/pill_bottle/strong_painkillers,
		/obj/item/pill_bottle/antibiotics
	)

/obj/structure/closet/crate/med_crate/oxyloss
	name = "\improper Low oxygen crate"
	desc = "A crate with low oxygen equipment."
	closet_appearance = /decl/closet_appearance/crate/medical/oxygen

/obj/structure/closet/crate/med_crate/oxyloss/WillContain()
	return list(
		/obj/item/scanner/breath = 2,
		/obj/item/pill_bottle/oxygen = 2,
		/obj/item/pill_bottle/stabilizer
	)
/obj/structure/closet/crate/med_crate/toxin
	name = "\improper Toxin crate"
	desc = "A crate with toxin equipment."
	closet_appearance = /decl/closet_appearance/crate/medical/toxins

/obj/structure/closet/crate/med_crate/toxin/WillContain()
	return list(
		/obj/item/firstaid/surgery,
		/obj/item/pill_bottle/antitoxins = 2,
		/obj/item/chems/pill/antirads = 12
			)
