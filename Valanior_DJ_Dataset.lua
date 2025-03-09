local mp_versions = {}
_G.Valanior = _G.Valanior or {}
_G.Valanior.djDungeons = _G.Valanior.djDungeons or {}
local itemdir = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Magister Kalendris.blp"

for i = 1, 12 do
    table.insert(mp_versions, { name = "Mythic +" .. i, modifier = i - 1 })
end

table.insert(_G.Valanior.djDungeons, {
    name = "Dire Maul",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DireMaul.blp",
    bosses = {
        {
            bossID = 11486,
            spells = {},
            name = "Prince Tortheldrin",
            flat = itemdir,
            story = [[
    Prince Tortheldrin, the last scion of the once-proud Shen’dralar Highborne, clings desperately to the crumbling glory of his ancient lineage. When the Sundering tore the world apart, Tortheldrin’s people were left stranded within Eldre’Thalas (now Dire Maul). Determined to retain both his arcane power and royal status, Tortheldrin struck a forbidden pact with the demonic entity Immol’thar. He siphoned energies from this fiend to sustain himself and his subjects.

    Yet over the centuries, Tortheldrin’s noble facade twisted into cruel madness. Driven by paranoia and greed, the Prince hoarded magical tomes and relics, banishing or killing any who would challenge his rule- even his own kin. Unyielding and proud, he believes himself the rightful ruler of all that remains of the Highborne legacy, willing to sacrifice anything to keep that dominion intact. Adventurers who enter his domain must face the cold cunning of this ancient elf, fueled by centuries of stolen power and unquenchable ambition.
            ]]
        },
        {
            bossID = 11487,
            spells = {},
            name = "Magister Kalendris",
            flat = itemdir,
            story = [[
    Magister Kalendris served as Prince Tortheldrin’s chief advisor, responsible for maintaining arcane wards and silencing dissent among the Highborne exiles. In life, Kalendris was a scholar of Highborne magic who believed wholeheartedly in the pursuit of knowledge above all else. Yet under Tortheldrin’s rule, his studies turned to the forbidden.

    He now manipulates shadows and illusions with disquieting ease, a testament to the dark pacts made to keep the Shen’dralar alive and powerful. Those who stand in his way experience first-hand the creeping terror of his illusions that play on their fears. Despite his growing doubts about Tortheldrin’s tyranny, Magister Kalendris cannot relinquish the arcane gifts he has come to rely on, chaining himself as much to this doomed court as to his own thirst for hidden lore.
            ]]
        },
        {
            bossID = 11488,
            spells = {},
            name = "Illyanna Ravenoak",
            flat = itemdir,
            story = [[
    Once a revered huntress of the Kaldorei, Illyanna Ravenoak patrolled the vast forests around Eldre’Thalas, protecting its ancient secrets from invaders. When the Sundering reshaped Azeroth, she became trapped behind Dire Maul’s towering walls. Fighting to safeguard the new home of her people, Illyanna clashed with the Highborne who slowly turned to dark magics.

    During one fateful confrontation, arcane energies shattered her companion, the massive bear Ferra, and severed the deep spiritual bond between them. Maddened by grief, Illyanna was ensnared by Prince Tortheldrin’s minions. She now roams the western wing of Dire Maul, haunted by illusions of a world she once knew, her dear Ferra- raised again by twisted sorcery- forever at her side. Any who trespass must face the unrelenting fury of a huntress whose shattered spirit yearns for vengeance.
            ]]
        },
        {
            bossID = 11489,
            spells = {},
            name = "Tendris Warpwood",
            flat = itemdir,
            story = [[
    Tendris Warpwood, an ancient treant bound to the forest’s lifeblood, once proudly served as a guardian of Eldre’Thalas. When the Highborne’s dark experiments corrupted the flora, Tendris found his roots twisting with fel corruption. Desperate to fulfill his duty as protector, he resisted for centuries, battling creeping darkness that spread through his bark and branches.

    But the demonic energies binding Dire Maul eventually broke even his mighty will. Now, Tendris stands as a tormented guardian, lashing out at any intruders who enter the Capital Gardens. Blind to friend or foe, he is fueled by the twisted essence of the forest, the green life around him slowly succumbing to a tainted cycle. His anguished roars are a haunting echo of the once-noble spirit he possessed.
            ]]
        },
        {
            bossID = 11490,
            spells = {},
            name = "Zevrim Thornhoof",
            flat = itemdir,
            story = [[
    Zevrim Thornhoof is a satyr who long prowled the forests of Feralas, enthralled by any source of fel energy. His infernal curiosity led him deep into the corridors of Dire Maul, where he discovered the dark bargains struck by the Shen’dralar. Recognizing an opportunity, Thornhoof offered his mastery of fel enchantments in exchange for unchecked access to their demonic wellspring.

    Now, Zevrim’s chambers are filled with the stench of brimstone and corruption, as he performs sacrificial rituals to siphon life force and strengthen his demonic patrons. Sadistic and cunning, he delights in torturing captives, twisting their life essence to fuel his insatiable thirst for power. Challengers who stumble upon his lair become unwitting participants in his fel rites- unless they can stop him first.
            ]]
        },
        {
            bossID = 11492,
            spells = {},
            name = "Alzzin the Wildshaper",
            flat = itemdir,
            story = [[
    Once a devout Highborne botanist, Alzzin delved deeply into the arcane secrets of nature to preserve Eldre’Thalas’s lush gardens. Driven by a noble desire to keep the forests flourishing, he drew upon powers beyond mortal understanding, harnessing energies from the Emerald Dream and the demonic well imprisoned within Dire Maul.

    But such conflicting forces inevitably tore at Alzzin's sanity. Over time, the satyr influences and fel corruption seeped into his spells, mutating him into the Wildshaper. He stands as the ultimate expression of Dire Maul’s clash of nature and demonism. Thorns, vines, and twisted roots spring to his call, and those who challenge him must combat not just the shapeshifter himself, but the enraged flora and fauna he commands. Deep down, a fragmented part of Alzzin yearns for salvation, but the vile powers at his command snuff out any glimmer of redemption.
            ]]
        },
        {
            bossID = 11496,
            spells = {},
            name = "Immol'thar",
            flat = itemdir,
            story = [[
    Immol’thar is the demonic lynchpin of Dire Maul’s corruption, a powerful dread hound originally summoned by the Shen’dralar to serve as their source of arcane energy. What began as a carefully bound pact rapidly spiraled out of control. The demon’s energies sustained the Highborne, but in turn, they were forced to feed it with sacrificial souls and the life force of their own kin.

    For centuries, Immol’thar was kept within an arcane prison at the heart of Dire Maul, fueling the city’s wards. Over time, the wards weakened, and Immol’thar began breaking free, eager to unleash centuries of pent-up rage on any and all who dare trespass. Its howling echoes through the broken halls- a reminder of what happens when mortal ambition attempts to master a power far beyond its control.
            ]]
        },
        {
            bossID = 11501,
            spells = {},
            name = "King Gordok",
            flat = itemdir,
            story = [[
    King Gordok rules the ogres of Dire Maul’s northern wing with brutal strength and a simple creed: might makes right. Once a lowly grunt among the Gordunni clan, he fought his way up the ogre hierarchy in a series of vicious trials. When his clan was fractured by internal power struggles, Gordok seized the throne, declaring himself king of the entire compound.

    Though far from an intellectual mastermind, Gordok wields fear and brute force like no other, unifying ogres under his banner- or crushing them beneath his fists. He hoards the spoils of the Highborne’s arcane relics without understanding their true power. In the ogre halls, only one rule stands: obey King Gordok or become a messy smear on the stone floor.
            ]]
        },
        {
            bossID = 13280,
            spells = {},
            name = "Hydrospawn",
            flat = itemdir,
            story = [[
    Deep beneath the pool chambers of Dire Maul lurks Hydrospawn, a creature formed from elemental energies gone awry. Some say that Alzzin’s meddling with druidic and fel forces created a rift into the Plane of Water, summoning this aqueous being into Azeroth. Over time, Hydrospawn fused with the magical residue saturating Dire Maul, granting it an intelligence beyond typical elementals.

    This living surge of water defends its domain fiercely. It sees adventurers as intruders threatening the delicate balance that keeps its watery realm stable. Powerful jets of water and thunderous geysers are at its command, making it a deadly opponent. To face Hydrospawn is to challenge the raw might of the elemental planes, twisted by Dire Maul’s dark magic.
            ]]
        },
        {
            bossID = 14321,
            spells = {},
            name = "Guard Fengus",
            flat = itemdir,
            story = [[
    Guard Fengus is a colossal ogre renowned for his relentless appetite- both for food and for smashing anything that moves. Entrusted by King Gordok to patrol the Gordok Commons, Fengus’s simplistic approach to security involves pounding any suspicious figure into the ground until they either prove their loyalty or stop moving.

    Despite his brutish manner, Fengus has a peculiar sense of camaraderie with the other guards, often seen sharing barrels of ale (and subsequent brawls) with them. Sometimes dismissed as a fool, he uses raw power to maintain order, though his greatest threats may be an empty belly or a short temper- whichever flares up first.
            ]]
        },
        {
            bossID = 14322,
            spells = {},
            name = "Stomper Kreeg",
            flat = itemdir,
            story = [[
    Stomper Kreeg earned his nickname for the drunken tantrums he throws, each footstep shaking the very foundations of Dire Maul. Once a wandering ogre mercenary, he discovered the never-ending kegs of Dire Maul’s north wing and decided to stay forever. Now, Kreeg can typically be found stumbling around, clutching a jug of potent grog, bellowing old ogre war songs out of tune.

    In battle, he is unpredictable: his drunken state makes him both unstable and terrifyingly strong. Sly adventurers sometimes try to bribe him with booze to avoid a fight, but if Kreeg takes offense (or senses a chance for a brawl), he’ll charge in with a wild roar that echoes through the stone halls. Surviving the flailing fists of a drunken ogre is no small feat.
            ]]
        },
        {
            bossID = 14323,
            spells = {},
            name = "Guard Slip'kik",
            flat = itemdir,
            story = [[
    Guard Slip’kik stands apart from the other ogres by virtue of his surprising cleverness. He is tasked with one of the more critical security roles within the Gordok Halls- maintaining traps and illusions that keep intruders disoriented. Slip’kik quietly tinkers with arcane artifacts stolen from the Highborne, rigging them into makeshift alarms or explosive wards.

    Because of his knack for gadgets, Slip’kik harbors a rare (for an ogre) appreciation of planning and subtlety, though he’s still an ogre at heart- throwing a punch is never off the table. Adventurers who underestimate his cunning may find themselves ensnared in a magical trap, followed by a swift beating at the hands of a guard who proves ogres can be as crafty as they are strong.
            ]]
        },
        {
            bossID = 14324,
            spells = {},
            name = "Cho'Rush the Observer",
            flat = itemdir,
            story = [[
    Cho’Rush the Observer is no ordinary ogre. Gifted with a keen mind from his earliest days, he rose to become King Gordok’s trusted advisor. Through half-glimpsed scrolls and stolen tomes of elven magic, Cho’Rush acquired knowledge that sets him apart from his kin. He lurks just beside Gordok’s throne, silently observing, a robed figure among the chaotic masses of ogres.

    Though he rarely speaks, his arcane talents are formidable. Rumors whisper that he can peer beyond the mortal veil, glimpsing secret powers to better serve his king. When Gordok’s reign is challenged, Cho’Rush reveals his true prowess- hurling spells that bend reality. Those who survive his arcane onslaught suspect Cho’Rush’s loyalty may not be as absolute as it seems; no one truly knows where his hidden studies may lead him, or how they might reshape Dire Maul’s fate.
            ]]
        },
        {
            bossID = 14325,
            spells = {},
            name = "Captain Kromcrush",
            flat = itemdir,
            story = [[
    Captain Kromcrush commands the Gordok military with ruthless discipline. A towering, heavily-armored ogre, he enforces King Gordok’s decrees with relentless ferocity. Known for his tactical efficiency- impressive by ogre standards- Kromcrush drills lesser ogres in basic formations and battle chants, forging a fighting force that can overwhelm foes through sheer size and brutality.

    Despite his stern demeanor, Kromcrush thrives on the thrill of conflict. He regards cunning and strategy as important tools but believes raw might always triumphs in the end. Anyone caught undermining Gordok’s rule or disrespecting Kromcrush’s orders quickly learns that the Captain wields more than just an intimidating presence- he backs it up with punishing blows that echo through the halls.
            ]]
        },
        {
            bossID = 14326,
            spells = {},
            name = "Guard Mol'dar",
            flat = itemdir,
            story = [[
    Guard Mol’dar is a grim, hulking sentinel posted deep in the Gordok stronghold. Stoic and quiet, he has served King Gordok longer than any other guard. He carries the weight of countless battles, proudly wearing crude trophies from his fallen foes: broken shields, shattered swords, and other reminders of his prowess.

    Mol’dar rarely leaves his post, standing watch by the giant doors that protect Gordok’s most valued holdings. Some say he sleeps with one eye open, never truly at rest. He lets his fists do the talking, meeting intruders with an unbreakable defense and punishing counterattacks. Rumor suggests Mol’dar’s loyalty is rooted in an old debt to King Gordok, a debt paid in blood and unending vigilance.
            ]]
        },
        {
            bossID = 14327,
            spells = {},
            name = "Lethtendris",
            story = [[
    Lethtendris is a renegade sorceress who slipped into Dire Maul in pursuit of arcane artifacts to fuel her twisted experiments. She delights in manipulating fel energies, weaving illusions that ensnare minds and warp bodies. Rumor has it she once studied under a demonologist of the Burning Legion, learning the secrets of soul-binding and demonic summoning.

    Now, Lethtendris’s personal chambers are cluttered with soul gems and half-finished spells. She enthralls lesser demons to defend her domain, cackling as she tests new ways to rend flesh and warp spirit. In her blind arrogance, she believes her power surpasses even the Highborne’s- yet the energies of Dire Maul are notoriously fickle, and her tampering could unleash horrors far beyond her control.
            ]]
        },
        {
            bossID = 14354,
            spells = {},
            name = "Pusillin",
            flat = itemdir,
            story = [[
    Pusillin is an imp of extraordinary mischief, bound to Dire Maul through ancient demonic pacts. Unlike the grand fiends who exude malevolence, Pusillin’s menace comes in the form of cunning pranks and trickery. He scurries through the corridors, stealing tomes and teasing travelers into labyrinthine chases.

    Though small in stature, Pusillin’s magical skills allow him to slip between realms, vanishing in the blink of an eye, only to reappear with a mocking cackle. Adventurers frequently fall victim to his taunts and illusions. Some suspect Pusillin gathers knowledge for a greater demonic power, while others believe he’s simply reveling in tormenting mortal “playthings.” Either way, those who underestimate the wicked gleam in Pusillin’s eyes may find themselves ensnared in an impish game they can’t win.
            ]]
        }
    },
    versions = mp_versions,
    specialItems = { 22309, 18780 },
    specialDrop = { [[Magister Kalendris]], [[King Gordok]] },
    items = { 521501, 522001, 525001, 525501, 531501, 522501, 523501, 528001, 530001, 531001, 523001, 524001, 526501, 529001, 530501, 527001, 527501, 529501, 532001, 532501, 533001, 521001, 554501, 555001, 556501, 560001, 594001, 534001, 544001, 552001, 557001, 562501, 565501, 534501, 542001, 552501, 553001, 554001, 561501, 524501, 553501, 555501, 556001, 564501, 595501, 528501, 558001, 558501, 559001, 559501, 594501, 560501, 561001, 562001, 563001, 563501, 595001, 520001, 542501, 557501, 564001, 566001, 567001, 533501, 537001, 537501, 548001, 548501, 549501, 520501, 538501, 540001, 543501, 551501, 565001, 526001, 535001, 535501, 543001, 546501, 566501, 536001, 536501, 544501, 545501, 546001, 567501, 538001, 539001, 541501, 545001, 547501, 550001, 539501, 540501, 541001, 547001, 549001, 550501, 551001 },
    droplocation = { [[Lethtendris]], [[Lethtendris]], [[Lethtendris]], [[Lethtendris]], [[Lethtendris]], [[Hydrospawn]], [[Hydrospawn]], [[Hydrospawn]], [[Hydrospawn]], [[Hydrospawn]], [[Zevrim Thornhoof]], [[Zevrim Thornhoof]], [[Zevrim Thornhoof]], [[Zevrim Thornhoof]], [[Zevrim Thornhoof]], [[Alzzin the Wildshaper]], [[Alzzin the Wildshaper]], [[Alzzin the Wildshaper]], [[Alzzin the Wildshaper]], [[Alzzin the Wildshaper]], [[Alzzin the Wildshaper]], [[Guard Mol'dar]], [[Guard Mol'dar]], [[Guard Mol'dar]], [[Guard Mol'dar]], [[Guard Mol'dar]], [[Guard Mol'dar]], [[Stomper Kreeg]], [[Stomper Kreeg]], [[Stomper Kreeg]], [[Stomper Kreeg]], [[Stomper Kreeg]], [[Stomper Kreeg]], [[Guard Fengus]], [[Guard Fengus]], [[Guard Fengus]], [[Guard Fengus]], [[Guard Fengus]], [[Guard Fengus]], [[Guard Slip'kik]], [[Guard Slip'kik]], [[Guard Slip'kik]], [[Guard Slip'kik]], [[Guard Slip'kik]], [[Guard Slip'kik]], [[Captain Kromcrush]], [[Captain Kromcrush]], [[Captain Kromcrush]], [[Captain Kromcrush]], [[Captain Kromcrush]], [[Captain Kromcrush]], [[King Gordok]], [[King Gordok]], [[King Gordok]], [[King Gordok]], [[King Gordok]], [[King Gordok]], [[Cho'Rush the Observer]], [[Cho'Rush the Observer]], [[Cho'Rush the Observer]], [[Cho'Rush the Observer]], [[Cho'Rush the Observer]], [[Cho'Rush the Observer]], [[Tendris Warpwood]], [[Tendris Warpwood]], [[Tendris Warpwood]], [[Tendris Warpwood]], [[Tendris Warpwood]], [[Tendris Warpwood]], [[Magister Kalendris]], [[Magister Kalendris]], [[Magister Kalendris]], [[Magister Kalendris]], [[Magister Kalendris]], [[Magister Kalendris]], [[Tsu'zee]], [[Tsu'zee]], [[Tsu'zee]], [[Tsu'zee]], [[Tsu'zee]], [[Tsu'zee]], [[Illyanna Ravenoak]], [[Illyanna Ravenoak]], [[Illyanna Ravenoak]], [[Illyanna Ravenoak]], [[Illyanna Ravenoak]], [[Illyanna Ravenoak]], [[Immol'thar]], [[Immol'thar]], [[Immol'thar]], [[Immol'thar]], [[Immol'thar]], [[Immol'thar]], [[Prince Tortheldrin]], [[Prince Tortheldrin]], [[Prince Tortheldrin]], [[Prince Tortheldrin]], [[Prince Tortheldrin]], [[Prince Tortheldrin]], [[Prince Tortheldrin]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Ragefire Chasm",
    description = [[Buried deep beneath Orgrimmar, Ragefire Chasm is infested with dark forces.]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RagefireChasm.blp",
    bosses = {
        {
            bossID = 11517,
            spells = { 21147, 21098, 19983, 21099, 21097, 22067 },
            name = "Oggleflint",
            story = [[
            Oggleflint was once the chieftain of a small trogg clan, drawn by the chaotic energies radiating from beneath Orgrimmar. Determined to expand his tribe’s territory, he led a foolhardy assault through molten caverns. Twisted by rage and driven by primal instincts, Oggleflint now defends the Chasm with frenzied zeal, attacking any who dare intrude.
                        ]]
        },
        {
            bossID = 11518,
            spells = {},
            name = "Jergosh the Invoker",
            story = [[
            Jergosh the Invoker is a shadowy orc warlock who delves into forbidden demonic arts. He sees the endless fires of Ragefire Chasm as the perfect crucible for harnessing fel power. With each ritual, Jergosh’s eyes burn brighter, reflecting the infernal pact he forged. Those who confront him face hexes and curses whispered from the darkest voids.
                        ]]
        },
        {
            bossID = 11519,
            spells = {},
            name = "Bazzalan",
            story = [[
            A cunning rogue adept in shadowy arts, Bazzalan slipped into Ragefire Chasm to strike a secret deal with the Searing Blade cultists. Skilled in both dagger and deception, he uses the twisting lava tunnels as his personal hunting grounds. His motivations remain murky, but rumor has it he seeks ancient relics to elevate his own status within the Horde- or possibly beyond.
                        ]]
        },
        {
            bossID = 11520,
            spells = {},
            name = "Taragaman the Hungerer",
            story = [[
            Taragaman is a towering felguard summoned to protect the Searing Blade’s operations deep within Ragefire Chasm. This brutal demon thrives on raw carnage, its burning blade carving through rock and flesh alike. Bound by infernal pacts, Taragaman slaughters all who threaten the cult’s plans, feeding on their fear and agony to fuel his unholy might.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 665501, 666001, 666501, 667001, 389001, 390001, 390501, 667501, 668001, 668501, 669001, 669501 },
    droplocation = { "Oggleflint", "Oggleflint", "Oggleflint", "Oggleflint", "Taragaman the Hungerer", "Taragaman the Hungerer", "Taragaman the Hungerer", "Taragaman the Hungerer", "Bazzalan", "Bazzalan", "Bazzalan", "Bazzalan" }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Wailing Caverns",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-WailingCaverns.blp",
    bosses = {
        {
            bossID = 3653,
            spells = {},
            name = "Kresh",
            story = [[
            Kresh is a colossal turtle that once wandered the oasis outside these caverns. Lured by the druidic energies twisting within Wailing Caverns, it now roams its watery lairs in a permanent state of agitation. Shell as tough as stone, Kresh snaps at adventurers foolish enough to disturb its tranquil domain, guarding secrets only known to the wildlife dwelling within.
                        ]]
        },
        {
            bossID = 3654,
            spells = {},
            name = "Mutanus the Devourer",
            story = [[
            Mutanus the Devourer is the monstrous culmination of the Nightmare’s corrupting influence. Twisted from a once-docile beast, he lurks in the darkest waters beneath the caverns. Swollen with chaotic magic and harboring a ravenous hunger, Mutanus devours both flesh and spirit, eager to spread the Nightmare’s taint beyond his watery prison.
                        ]]
        },
        {
            bossID = 3669,
            spells = {},
            name = "Lord Cobrahn",
            story = [[
            Once a skilled druid, Lord Cobrahn fell under the sway of the Emerald Nightmare as he sought to restore balance to the Barrens. Transformed into a serpent-like creature, he now plots within the Wailing Caverns, using venomous powers to convert lost souls to his warped vision of harmony- one steeped in poison and delirium.
                        ]]
        },
        {
            bossID = 3670,
            spells = {},
            name = "Lord Pythas",
            story = [[
            Lord Pythas, a gifted shape-shifter, embraced the primal fury of reptiles under the Nightmare’s influence. His twisted form channels storms of nature magic, coiling electricity around him like a serpent. Once dedicated to nurturing life, he now revels in unleashing destructive energies upon trespassers who defy the caverns’ corrupted harmony.
                        ]]
        },
        {
            bossID = 3671,
            spells = {},
            name = "Lady Anacondra",
            story = [[
            A self-styled priestess of the Nightmare, Lady Anacondra uses her hypnotic voice to enthrall lesser beings into her brood. Cloaked in serpentine grace, she weaves illusions to lure the unsuspecting deeper into the caverns. Beneath her placid demeanor lies a ruthless fanatic determined to bring Azeroth under the slithering embrace of her twisted dreams.
                        ]]
        },
        {
            bossID = 3673,
            spells = {},
            name = "Lord Serpentis",
            story = [[
            Once a revered elder druid, Lord Serpentis sank further than any into the Nightmare’s grasp. His mastery of reptilian forms- already profound- grew horrifying under the corruption. With cunning intelligence and venomous might, he lords over these caverns as a zealot to the Nightmare’s cause, convinced that he alone understands the true shape nature must take.
                        ]]
        },
        {
            bossID = 3674,
            spells = {},
            name = "Skum",
            story = [[
            Skum is a massive thunder lizard warped by the energies coursing through Wailing Caverns. Constant arcs of electricity crackle across its spined back. The beast’s roars echo through dripping tunnels, a dire warning to those who approach. Few realize the unnatural lightning surging through Skum is a direct manifestation of the Nightmare’s creeping infection.
                        ]]
        },
        {
            bossID = 5775,
            spells = {},
            name = "Verdan the Everliving",
            story = [[
            Verdan the Everliving was once the heart of druidic experimentation in these caverns- an experiment gone tragically awry. Meant to protect and grow the flora, Verdan fused with the raw essence of nature, ballooning into a living colossus. Now, green energies ooze from its every pore, attacking intruders who threaten the warped ecosystem it desperately clings to.
                        ]]
        },
        {
            bossID = 5912,
            spells = {},
            name = "Deviate Faerie Dragon",
            story = [[
            Deep in the hidden groves of the caverns, a rare Faerie Dragon fell victim to the chaotic influences drifting in the air. Twisting colors ripple off its wings, scattering illusions through the shadows. Neither wholly friend nor foe, this curious creature guards ancient glades with a playful malice- capable of bewitching minds or luring them astray into perilous dens.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 140001, 350501, 131001, 220501, 142001, 143501, 219501, 130001, 147501, 144501, 145001, 221001, 140501, 141001, 133501, 141501, 144001, 220001, 146001, 146501, 147001, 142501, 143001, 145501 },
    droplocation = { [[Kresh]], [[Kresh]], [[Lady Anacondra]], [[Lady Anacondra]], [[Lord Cobrahn]], [[Lord Cobrahn]], [[Lord Cobrahn]], [[Faerie Dragon]], [[Faerie Dragon]], [[Lord Pythas]], [[Lord Pythas]], [[Lord Pythas]], [[Skum]], [[Skum]], [[Lord Serpentis]], [[Lord Serpentis]], [[Lord Serpentis]], [[Lord Serpentis]], [[Verdan the Everliving]], [[Verdan the Everliving]], [[Verdan the Everliving]], [[Mutanus the Devourer]], [[Mutanus the Devourer]], [[Mutanus the Devourer]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "The Deadmines",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Deadmines.blp",
    bosses = {
        {
            bossID = 639,
            spells = {},
            name = "Edwin VanCleef",
            story = { [[Edwin VanCleef, once a prominent architect and leader of the Stonemasons Guild, became an outlaw after the nobles of Stormwind refused to pay for the reconstruction of the city. Driven by betrayal and a thirst for vengeance, he formed the Defias Brotherhood, turning to a life of piracy and rebellion from his hidden base in the Deadmines.]] }
        },
        {
            bossID = 642,
            spells = {},
            name = "Sneed's Shredder",
            story = { [[Originally designed to assist in lumber operations, Sneed's Shredder is a mechanical marvel gone rogue.  It represents the fusion of goblin engineering and the Defias Brotherhood's need for powerful tools in their mining operations.  It stands as a testament to uncontrolled invention and the dangers of automated machinery in the wrong hands.]] }
        },
        {
            bossID = 643,
            spells = {},
            name = "Sneed",
            story = { [[Sneed, a crafty goblin engineer and a key member of the Defias Brotherhood, oversees the lumber operations within the Deadmines. Loyal to VanCleef and skilled in mechanics, he pilots his shredder, protecting the Brotherhood's interests and resources with ruthless efficiency.]] }
        },
        {
            bossID = 644,
            spells = {},
            name = "Rhahk'Zor",
            story = { [[Rhahk'Zor is a powerful ogre, serving as a brutal overseer within the Deadmines.  He enforces the will of the Defias Brotherhood, using his immense strength and brute force to keep the miners in line and crush any resistance. He embodies the raw muscle behind the operation.]] }
        },
        {
            bossID = 645,
            spells = {},
            name = "Cookie",
            story = { [[Cookie, once a simple cook aboard a merchant vessel, was captured by the Defias Brotherhood and now serves as the murloc chef for the Defias pirates aboard the ship in the Deadmines.  He's known for his... *unconventional* culinary creations, made from whatever ingredients he can find (or capture).]] }
        },
        {
            bossID = 646,
            spells = {},
            name = "Mr. Smite",
            story = { [[Mr. Smite, a formidable tauren blacksmith, serves as the First Mate of the Defias ship deep within the Deadmines.  Once a respected craftsman, he now uses his skills to forge weapons and armor for the Brotherhood. His presence on the ship represents a significant threat, combining strength, skill, and fiery temper.]] }
        },
        {
            bossID = 647,
            spells = {},
            name = "Captain Greenskin",
            story = { [[Captain Greenskin, a cunning and opportunistic goblin, commands the Defias ship that lies at the heart of the Deadmines.  He's a shrewd negotiator and a ruthless pirate, driven by greed and a desire for power. He represents the leadership of the Defias forces within the final part of the instance.]] }
        },
        {
            bossID = 1763,
            spells = {},
            name = "Gilnid",
            story = { [[Gilnid is a kobold geomancer, a master of earth magic, found deep within the Deadmines.  He represents the primal, untamed forces that the Defias have either allied with or subjugated to further their mining operations. His presence hints at the darker, more mystical elements at play.]] }
        },
        {
            bossID = 3586,
            spells = {},
            name = "Miner Johnson",
            story = { [[Miner Johnson is a rare, non-hostile kobold found deep in the Deadmines.  Unlike his brethren, he seems to have retained a sense of independent thought and perhaps even regret for the actions of his kin. He represents a flicker of hope and the possibility of redemption amidst the darkness. He may even give the player a useful item or hint.]] }
        },
    },
    versions = mp_versions,
    items = { 100501, 124501, 131501, 132001, 217501, 109001, 112501, 218001, 102001, 128001, 218501, 125501, 126501, 161501, 128501, 129001, 219001, 125001, 126001, 129501, 217001, 127001, 127501 },
    droplocation = { [[Rhahk'Zor]], [[Rhahk'Zor]], [[Miner Johnson]], [[Miner Johnson]], [[Miner Johnson]], [[Sneed's Shredder]], [[Sneed's Shredder]], [[Sneed's Shredder]], [[Gilnid]], [[Gilnid]], [[Gilnid]], [[Mr. Smite]], [[Mr. Smite]], [[Mr. Smite]], [[Captain Greenskin]], [[Captain Greenskin]], [[Captain Greenskin]], [[Edwin VanCleef]], [[Edwin VanCleef]], [[Edwin VanCleef]], [[Edwin VanCleef]], [[Cookie]], [[Cookie]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Shadowfang Keep",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ShadowFangKeep.blp",
    bosses = {
        {
            bossID = 3872,
            spells = {},
            name = "Deathsworn Captain",
            story = [[
            No living record names this phantom knight, only that his spirit is bound to Shadowfang Keep’s cursed ramparts. Cloaked in tattered banners, the Deathsworn Captain haunts the courtyard, forever reliving the last battle he fought against worgen invaders. A dreadful aura of undeath hangs around him, warning intruders of his eternal vigil.
                        ]]
        },
        {
            bossID = 3886,
            spells = {},
            name = "Razorclaw the Butcher",
            story = [[
            Once a feral worgen with insatiable bloodlust, Razorclaw earned his savage moniker by ripping through unsuspecting victims with bestial fury. Lurking in gore-splattered halls, he collects the remnants of his kills, creating grotesque trophies. Any who wander too close soon learn why he’s called “the Butcher.”
                        ]]
        },
        {
            bossID = 3887,
            spells = {},
            name = "Baron Silverlaine",
            story = [[
            Baron Silverlaine was the noble owner of Shadowfang Keep before the worgen curse befell his estate. Even in undeath, the baron mourns his lost legacy, wandering the halls in spectral form. Wracked with guilt for what befell his people, he lashes out at intruders, believing them to be more villains come to defile his ancestral home.
                        ]]
        },
        {
            bossID = 3914,
            spells = {},
            name = "Rethilgore",
            story = [[
            Rethilgore is a vampiric entity that seized the Keep’s dungeons as a feeding ground. Drawn to the swirling dark energies within these walls, he enslaves imprisoned souls, slowly draining their life force. His unnerving shrieks echo in the lower cells, luring the unwary into his grasp.
                        ]]
        },
        {
            bossID = 3927,
            spells = {},
            name = "Wolf Master Nandos",
            story = [[
            Wolf Master Nandos once led the keep’s guards but gradually succumbed to the savage curse. Now, with worgen blood coursing through his veins, he raises vicious wolf packs in the hidden kennels. His loyalty to any lord or baron has faded; only the call of the hunt remains, driving him to unleash his ravenous hounds on trespassers.
                        ]]
        },
        {
            bossID = 4274,
            spells = {},
            name = "Fenrus the Devourer",
            story = [[
            Fenrus was once an ordinary wolf pup caught in the swirl of arcane experiments within Shadowfang Keep. Mutated and grown monstrous, Fenrus tears through the keep’s corridors, eternally hungry. His glowing eyes reflect a feral intelligence beyond that of a normal beast- hinting that he, too, is touched by the lingering curse.
                        ]]
        },
        {
            bossID = 4278,
            spells = {},
            name = "Commander Springvale",
            story = [[
            Commander Springvale was one of Gilneas’s most decorated knights before Arugal’s dark magic consumed him. Now, as an accursed worgen, he retains a knight’s discipline twisted by primal fury. He stands resolute in Shadowfang Keep’s armory, ensuring that all who seek to disrupt Arugal’s experiments must face his sword and fang.
                        ]]
        },
        {
            bossID = 4279,
            spells = {},
            name = "Odo the Blindwatcher",
            story = [[
            Odo the Blindwatcher was a guardsman whose eyes were scorched by arcane energies. Blind yet far from powerless, he relies on uncanny senses granted by the curse. Roaming darkened passageways, Odo calls upon spectral hounds to lead him toward the heartbeat of any intruder, then strikes with unnerving precision.
                        ]]
        },
        {
            bossID = 4275,
            spells = {},
            name = "Archmage Arugal",
            story = [[
            Archmage Arugal is the architect of Shadowfang Keep’s downfall. Driven mad by the worgen curse he unleashed upon Gilneas, he retreated here to continue his forbidden experiments. The tortured howls of his creations echo through the halls, and Arugal himself looms like a specter, conjuring twisted spells and commanding the ravenous beasts.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 108501, 115501, 130501, 139001, 102501, 134501, 148001, 104501, 137001, 137501, 672501, 119501, 136501, 673001, 103001, 135501, 136001, 105001, 148501, 149001, 113001, 120501, 138501, 105501, 123501, 135001, 134001, 138001, 139501 },
    droplocation = { [[Rethilgore]], [[Rethilgore]], [[Rethilgore]], [[Fel Steed]], [[Razorclaw the Butcher]], [[Razorclaw the Butcher]], [[Razorclaw the Butcher]], [[Baron Silverlaine]], [[Baron Silverlaine]], [[Baron Silverlaine]], [[Baron Silverlaine]], [[Commander Springvale]], [[Commander Springvale]], [[Commander Springvale]], [[Odo the Blindwatcher]], [[Odo the Blindwatcher]], [[Odo the Blindwatcher]], [[Deathsworn Captain]], [[Deathsworn Captain]], [[Deathsworn Captain]], [[Fenrus the Devourer]], [[Fenrus the Devourer]], [[Fenrus the Devourer]], [[Wolf Master Nandos]], [[Wolf Master Nandos]], [[Wolf Master Nandos]], [[Archmage Arugal]], [[Archmage Arugal]], [[Archmage Arugal]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Blackfathom Deeps",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps.blp",
    bosses = {
        {
            bossID = 4829,
            spells = {},
            name = "Aku'mai",
            story = [[
            Aku’mai is an ancient hydra and favored pet of the Old Gods’ servants. Dormant for centuries, it was awakened by Twilight’s Hammer cultists, who feed it sacrifices in exchange for vile blessings. Its three snapping heads embody unyielding hunger for flesh and souls, making Aku’mai a terror of the watery depths.
                        ]]
        },
        {
            bossID = 4830,
            spells = {},
            name = "Old Serra'kis",
            story = [[
            Old Serra’kis is a massive, elder sea serpent that has thrived for ages in the submerged caverns of Blackfathom Deeps. Once considered a protector of the deep waters, it has since grown vicious and territorial, twisting around broken temple columns and striking any who enter its cold domain without reverence.
                        ]]
        },
        {
            bossID = 4831,
            spells = {},
            name = "Lady Sarevess",
            story = [[
            A Naga sorceress with a fierce dedication to Queen Azshara, Lady Sarevess studies the crumbling ruins beneath the sea to unlock arcane secrets. Ruthless and ambitious, she harnesses the tides and storms, channeling water elementals to crush those who threaten her mission to restore naga dominance.
                        ]]
        },
        {
            bossID = 4832,
            spells = {},
            name = "Twilight Lord Kelris",
            story = [[
            Twilight Lord Kelris is an influential member of the Twilight’s Hammer cult, using the ancient elven shrine of Blackfathom as a staging ground for dark rituals. Obsessed with ushering in the Old Gods’ return, he leads frenzied ceremonies to break the boundaries between mortal lands and eldritch abysses.
                        ]]
        },
        {
            bossID = 4887,
            spells = {},
            name = "Ghamoo-ra",
            story = [[
            Ghamoo-ra is a colossal turtle said to be spawned from the turbulent energies that shaped Azeroth’s seas. Its shell is etched with markings older than any known empire. This primeval guardian lashes out at interlopers with tidal fury, defending the sacred waters it has known since the world’s dawn.
                        ]]
        },
        {
            bossID = 6243,
            spells = {},
            name = "Gelihast",
            story = [[
            Gelihast was once a brash murloc warlord, rising through ranks by forging alliances with the naga. He patrols the flooded passages of Blackfathom, rallying amphibious minions to ambush lost travelers. The hiss of his voice echoes along submerged corridors, a constant reminder that these caverns belong to the briny depths.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 123001, 159001, 159501, 670501, 101001, 119001, 122001, 256001, 121001, 158001, 158501, 671001, 101501, 116501, 157001, 671501, 114501, 156001, 156501, 157501, 160001, 160501, 161001, 672001 },
    droplocation = { [[Ghamoo-ra]], [[Ghamoo-ra]], [[Ghamoo-ra]], [[Ghamoo-ra]], [[Lady Sarevess]], [[Lady Sarevess]], [[Lady Sarevess]], [[Lady Sarevess]], [[Gelihast]], [[Gelihast]], [[Gelihast]], [[Gelihast]], [[Twilight Lord Kelris]], [[Twilight Lord Kelris]], [[Twilight Lord Kelris]], [[Twilight Lord Kelris]], [[Old Serra'kis]], [[Old Serra'kis]], [[Old Serra'kis]], [[Old Serra'kis]], [[Aku'mai]], [[Aku'mai]], [[Aku'mai]], [[Aku'mai]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "The Stockades",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheStockade.blp",
    bosses = {
        {
            bossID = 1663,
            spells = {},
            name = "Dextren Ward",
            story = [[
            A cunning ringleader among the city’s worst criminals, Dextren Ward instigated multiple prison uprisings in Stormwind. From within the dark passages of the Stockades, he organizes riots and intimidation tactics, fueled by a deep-seated desire to undermine the King’s authority. He remains a perpetual thorn in the side of Stormwind’s guards.
                        ]]
        },
        {
            bossID = 1666,
            spells = {},
            name = "Kam Deepfury",
            story = [[
            Kam Deepfury, once an influential extremist agitator, was locked away for inciting rebellion and sabotage. Unrepentant even behind bars, he continues to stir unrest among fellow inmates. His fury is legendary; it’s said that in fits of rage, he can bend the very iron bars of his cell.
                        ]]
        },
        {
            bossID = 1696,
            spells = {},
            name = "Targorr the Dread",
            story = [[
            Condemned for heinous crimes across Elwynn Forest, Targorr the Dread is a brutal savage who rules by pure terror. The other inmates fear him as much as the guards do, and rumors say that even the warden hesitates to confront Targorr when he prowls the corridors, thirsting for the next fight.
                        ]]
        },
        {
            bossID = 1716,
            spells = {},
            name = "Bazil Thredd",
            story = [[
            Bazil Thredd was once a covert operative tied to shady dealings in the Underworld of Stormwind. After a sting operation exposed his espionage, he was thrown into the Stockades. Ever calculating, Thredd continues to manage secret contacts, hoping to leverage alliances that might one day free him- or help him exact revenge.
                        ]]
        },
        {
            bossID = 1717,
            spells = {},
            name = "Hamhock",
            story = [[
            Hamhock is a gluttonous berserker whose appetite for destruction matches his love of feasting. Initially arrested for public rampages, he turned the cramped Stockades into his personal brawling pit. Guards quickly learned to keep their distance unless heavily armed, as Hamhock’s hulking form can break through walls- and bones- with ease.
                        ]]
        },
        {
            bossID = 1720,
            spells = {},
            name = "Bruegal Ironknuckle",
            story = [[
            Feared among rogues and cutthroats, Bruegal Ironknuckle was apprehended when a botched heist led him straight into a garrison’s trap. Incarcerated here, he’s lost none of his vicious edge. Clad in ragged, improvised armor, Bruegal challenges anyone- guard or inmate- who dares to cross him, priding himself on undefeated fists.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 117001, 211501, 675501, 115001, 121501, 676001, 103501, 122501, 676501, 107501, 109501, 214001, 106001, 107001, 677001, 118001, 118501, 120001 },
    droplocation = { [[Targorr the Dread]], [[Targorr the Dread]], [[Targorr the Dread]], [[Kam Deepfury]], [[Kam Deepfury]], [[Kam Deepfury]], [[Hamhock]], [[Hamhock]], [[Hamhock]], [[Dextren Ward]], [[Dextren Ward]], [[Dextren Ward]], [[Bazil Thredd]], [[Bazil Thredd]], [[Bazil Thredd]], [[Bruegal Ironknuckle]], [[Bruegal Ironknuckle]], [[Bruegal Ironknuckle]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Gnomeregan",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Gnomeregan.blp",
    bosses = {
        {
            bossID = 6228,
            spells = {},
            name = "Dark Iron Ambassador",
            story = [[
            A cunning diplomat-turned-spy for the Dark Iron dwarves, the Ambassador slipped into Gnomeregan just before its fall. He now searches the irradiated city for leftover weapon schematics and valuable secrets. Even among the trogg-infested corridors, his presence is keenly felt- wherever sabotage is likely, he’s never far behind.
                        ]]
        },
        {
            bossID = 6229,
            spells = {},
            name = "Crowd Pummeler 9-60",
            story = [[
            A colossal automated enforcer originally designed for crowd control, the Crowd Pummeler 9-60 was repurposed as a ruthless guardian. Malfunctioning after the Gnomeregan disaster, it sees every intruder as a riot in progress- responding with punishing mechanical fists and gear-driven precision. Its mechanical roar echoes through rusted halls.
                        ]]
        },
        {
            bossID = 6235,
            spells = {},
            name = "Electrocutioner 6000",
            story = [[
            Once a proud demonstration of gnomish ingenuity, Electrocutioner 6000 was built to harness vast amounts of electrical power. However, the chaos of Gnomeregan’s downfall left it corrupted by volatile energies. Now it roams the engineering labs, zapping the unwary with lethal surges of lightning in a never-ending test run.
                        ]]
        },
        {
            bossID = 7079,
            spells = {},
            name = "Viscous Fallout",
            story = [[
            Viscous Fallout is a living toxic ooze spawned from the radioactive waste flooding Gnomeregan’s pipes. It seeps through cracks, corroding metal and flesh alike. Each pulse of its gelatinous body carries a lethal dose of radiation, its mindless hunger propelling it toward any source of warmth or movement.
                        ]]
        },
        {
            bossID = 7361,
            spells = {},
            name = "Grubbis",
            story = [[
            Grubbis was once a burrowing menace kept at bay by the city’s advanced defenses. After the trogg invasion and catastrophic radiation leak, Grubbis thrives in the tunnels, devouring anything in its path. Mutated further by the toxic environment, this monstrous worm grows stronger with each subterranean feast.
                        ]]
        },
        {
            bossID = 7800,
            spells = {},
            name = "Mekgineer Thermaplugg",
            story = [[
            Sicco Thermaplugg, a brilliant yet unstable gnome engineer, betrayed his people and inadvertently triggered the radioactive meltdown that destroyed Gnomeregan. Now styling himself “Mekgineer,” Thermaplugg rules the toxic ruins from his mechanical throne, determined to prove his genius- even if it means dooming what’s left of his home.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 197501, 210001, 210501, 673501, 200501, 201001, 201501, 209501, 198001, 198501, 199001, 674001, 199501, 200001, 211001, 674501, 202001, 202501, 212001, 675001, 203001, 203501, 204001, 212501, 213001, 213501 },
    droplocation = { [[Grubbis]], [[Grubbis]], [[Grubbis]], [[Grubbis]], [[Viscous Fallout]], [[Viscous Fallout]], [[Viscous Fallout]], [[Viscous Fallout]], [[Electrocutioner 6010]], [[Electrocutioner 6011]], [[Electrocutioner 6012]], [[Electrocutioner 6013]], [[Crowd Pummeler 9-60]], [[Crowd Pummeler 9-60]], [[Crowd Pummeler 9-60]], [[Crowd Pummeler 9-60]], [[Dark Iron Ambassador]], [[Dark Iron Ambassador]], [[Dark Iron Ambassador]], [[Dark Iron Ambassador]], [[Mekgineer Thermaplugg]], [[Mekgineer Thermaplugg]], [[Mekgineer Thermaplugg]], [[Mekgineer Thermaplugg]], [[Mekgineer Thermaplugg]], [[Mekgineer Thermaplugg]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Scarlet Monastery",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ScarletMonastery.blp",
    bosses = {
        {
            bossID = 3974,
            spells = {},
            name = "Houndmaster Loksey",
            story = [[
            Houndmaster Loksey commands a ferocious pack of mastiffs within the Monastery’s hushed corridors. Loyal to the Scarlet cause, he trains these beasts to sniff out the undead- yet they will maul any intruder with equal fervor. Loksey believes the purity of his mission justifies any savage means, man or beast.
                        ]]
        },
        {
            bossID = 3975,
            spells = {},
            name = "Herod",
            story = [[
            Herod, the Scarlet Champion, is a fearsome fighter famous for his dizzying Whirlwind technique. Clad in red plate, he stands as the Monastery’s living embodiment of martial discipline. Even as the undead threat looms beyond their walls, Herod remains steadfast, convinced the Scarlet Crusade alone holds Azeroth’s salvation.
                        ]]
        },
        {
            bossID = 3976,
            spells = {},
            name = "Scarlet Commander Mograine",
            story = [[
            Commander Mograine is the charismatic leader of the Scarlet Monastery’s military division. Driven by unwavering zeal, he believes his holy crusade will cleanse Azeroth of any impurity- both undead and those who question his methods. Mograine’s fiery sermons stir devotion in his followers, fueling their relentless campaigns.
                        ]]
        },
        {
            bossID = 3977,
            spells = {},
            name = "High Inquisitor Whitemane",
            story = [[
            High Inquisitor Whitemane is revered by many Scarlets as a saintly figure. Her conviction is absolute: she wields the Light with terrifying resolve to root out all “darkness.” Yet beneath her serene visage lies a fanatical zeal that blinds her to the cruelty of her crusade. She’ll resurrect fallen allies or execute dissenters without a moment’s hesitation.
                        ]]
        },
        {
            bossID = 3983,
            spells = {},
            name = "Interrogator Vishas",
            story = [[
            Vishas is the Monastery’s chief torturer, consumed by sadistic glee in extracting confessions. He has perfected interrogation techniques that blur the line between faith and cruelty. Few can endure his twisted methods, as Vishas sees pain as a divine tool to purge the unworthy. His shrill laughter echoes through the dungeon halls.
                        ]]
        },
        {
            bossID = 4542,
            spells = {},
            name = "High Inquisitor Fairbanks",
            story = [[
            Once a trusted advisor to the Crimson Legion, Fairbanks uncovered damning secrets within the Crusade’s leadership. Betrayed by his own comrades, he was mortally wounded and hidden away, left to die. Now risen as a tortured spirit, he wanders the crypts, offering warnings of the Crusade’s hypocrisy to those willing to listen.
                        ]]
        },
        {
            bossID = 4543,
            spells = {},
            name = "Bloodmage Thalnos",
            story = [[
            An ambitious mage who dabbled in blood magic, Thalnos’s arrogance led him down a path of dark arcana. When the Crusade discovered his heresy, they attempted to cleanse him- but his soul clung to the crypt in undeath. Now he drains life from living souls, his twisted form hungering eternally for fresh blood.
                        ]]
        },
        {
            bossID = 6487,
            spells = {},
            name = "Arcanist Doan",
            story = [[
            Arcanist Doan is the Monastery’s archivist, tasked with preserving arcane knowledge deemed “essential” to the Crusade’s cause. While adept in illusions and protective wards, Doan’s mind teeters on the edge of fanaticism. He refuses to let any unworthy intruder corrupt his precious tomes, unleashing devastating magical blasts on trespassers.
                        ]]
        },
        {
            bossID = 6488,
            spells = {},
            name = "Fallen Champion",
            story = [[
            This tormented spirit was once a revered crusader who succumbed to doubt. Unwilling to let go of his post even in death, the champion haunts the crypts, restless and chained by regret. His spectral form endlessly reenacts his final stand, lashing out at the living as though they’re the undead he once swore to eradicate.
                        ]]
        },
        {
            bossID = 6489,
            spells = {},
            name = "Ironspine",
            story = [[
            Ironspine is a gargoyle-like abomination clinging to the Monastery’s stonework. Sealed in catacombs to guard the Crusade’s dark experiments, it has slumbered for decades. Now awakened by the Crusade’s fervor, its stony claws rend armor with ease, and its eyes glow with malevolent intelligence as it hunts fresh victims in the gloom.
                        ]]
        },
        {
            bossID = 6490,
            spells = {},
            name = "Azshir the Sleepless",
            story = [[
            Azshir the Sleepless was interred beneath the Monastery under suspicious circumstances. Struck with cursed insomnia in life, he found no rest in death. Now his moaning spirit trudges restlessly among the tombs, compelled by a maddening desire to destroy any who walk freely under the sun he will never see again.
                        ]]
        },
        {
            bossID = 6587,
            spells = {},
            name = "Archivist Thelryn",
            story = [[
            Archivist Thelryn was once a quiet scholar, meticulously recording the Crusade’s exploits and doctrines. But relentless exposure to grim secrets and brutal truths broke his sanity. Now obsessed with unraveling heretical texts, he mindlessly guards the forbidden volumes, lashing out at intruders who might expose the Crusade’s darkest lies.
                        ]]
        },
        {
            bossID = 6588,
            spells = {},
            name = "Drillmaster Varik",
            story = [[
            Drillmaster Varik prides himself on whipping new recruits into shape for the Scarlet cause. Every dawn sees him barking orders and drilling merciless exercises. His unwavering discipline and harsh punishments shape the Crusade’s foot soldiers- any who falter feel the sting of his lash and the fury of his unwavering conviction.
                        ]]
        },
        {
            bossID = 6589,
            spells = {},
            name = "Weaponsmith Helena",
            story = [[
            Weaponsmith Helena forges and maintains the arsenal used by the Scarlet Crusade. She reveres the Light, believing that every sword must be pure and strong to strike down the undead. Though a master craftswoman, her fervor matches any inquisitor’s zeal, ensuring each blade carries a righteous edge- and a deadly purpose.
                        ]]
        },
        {
            bossID = 6590,
            spells = {},
            name = "Brother Korloff",
            story = [[
            Known for his fiery fists and devotion to the Scarlet creed, Brother Korloff is a monk whose discipline rivals that of the monastery’s greatest warriors. He endures flames in his bare hands, an outward sign of his burning faith. In his eyes, only through fire can the undead plague be cleansed- and the unworthy be scorched.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 132501, 162001, 162501, 677501, 163001, 163501, 175501, 681001, 167001, 167501, 176501, 680501, 165501, 166001, 166501, 678001, 164001, 164501, 165001, 177001, 678501, 168001, 178001, 179001, 216501, 679001, 168501, 169001, 169501, 170001, 665001, 681501, 170501, 171001, 171501, 180001, 216001, 173501, 174001, 174501, 679501, 172001, 172501, 173001, 181001, 682001, 618001, 618501, 619001, 680001, 682501 },
    droplocation = { [[Interrogator Vishas]], [[Interrogator Vishas]], [[Interrogator Vishas]], [[Interrogator Vishas]], [[Bloodmage Thalnos]], [[Bloodmage Thalnos]], [[Bloodmage Thalnos]], [[Bloodmage Thalnos]], [[Azshir the Sleepless]], [[Azshir the Sleepless]], [[Azshir the Sleepless]], [[Azshir the Sleepless]], [[Fallen Champion]], [[Fallen Champion]], [[Fallen Champion]], [[Fallen Champion]], [[Ironspine]], [[Ironspine]], [[Ironspine]], [[Ironspine]], [[Ironspine]], [[Houndmaster Loksey]], [[Houndmaster Loksey]], [[Houndmaster Loksey]], [[Houndmaster Loksey]], [[Houndmaster Loksey]], [[Arcanist Doan]], [[Arcanist Doan]], [[Arcanist Doan]], [[Arcanist Doan]], [[Arcanist Doan]], [[Arcanist Doan]], [[Herod]], [[Herod]], [[Herod]], [[Herod]], [[Herod]], [[Scarlet Commander Mograine]], [[Scarlet Commander Mograine]], [[Scarlet Commander Mograine]], [[Scarlet Commander Mograine]], [[High Inquisitor Whitemane]], [[High Inquisitor Whitemane]], [[High Inquisitor Whitemane]], [[High Inquisitor Whitemane]], [[High Inquisitor Whitemane]], [[High Inquisitor Fairbanks]], [[High Inquisitor Fairbanks]], [[High Inquisitor Fairbanks]], [[High Inquisitor Fairbanks]], [[High Inquisitor Fairbanks]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Razorfen Kraul",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RazorfenKraul.blp",
    bosses = {
        {
            bossID = 4420,
            spells = {},
            name = "Overlord Ramtusk",
            story = [[
            Overlord Ramtusk is a bristling quillboar warlord. Renowned for his brutality, he unites fractious quillboar clans in the Kraul with sheer intimidation. Stories say he personally wrestled giant boars into submission, wearing their tusks as trophies. Any outsiders venturing into his domain learn quickly why the quillboar fear him.
                        ]]
        },
        {
            bossID = 4421,
            spells = {},
            name = "Charlga Razorflank",
            story = [[
            Charlga Razorflank is the matriarch of the Kraul and a dark shaman. She channels blood magic and the primal fury of her ancestors, using twisted rituals to empower her tribe. Believing she can forge a new quillboar empire, Charlga sacrifices intruders to the thorny labyrinth’s roots, feeding her dark spells.
                        ]]
        },
        {
            bossID = 4422,
            spells = {},
            name = "Agathelos the Raging",
            story = [[
            A massive boar infused with druidic corruption, Agathelos prowls the briar-choked warrens, its eyes burning with feral hatred. Some believe Charlga Razorflank summoned an ancient spirit to inhabit this beast, forging a living engine of destruction to guard the tribe. When it charges, the entire Kraul shakes.
                        ]]
        },
        {
            bossID = 4424,
            spells = {},
            name = "Aggem Thorncurse",
            story = [[
            Aggem Thorncurse is a quillboar mystic who delves into taboo spells, communing with malevolent spirits lurking in the briars. His twisted staff is etched with the runes of old curses. Thorncurse relishes turning foes into living conduits for vengeful spirits, their screams echoing in the spiny labyrinth.
                        ]]
        },
        {
            bossID = 4425,
            spells = {},
            name = "Blind Hunter",
            story = [[
            The Blind Hunter is a monstrous bat, rumored to be older than the Kraul itself. It roosts in the deepest pits, sensing prey through echolocation and a supernatural bond to the quillboar. In darkness, its leathery wings silently glide overhead- strike too late, and its fangs will already be at your throat.
                        ]]
        },
        {
            bossID = 4428,
            spells = {},
            name = "Death Speaker Jargba",
            story = [[
            As the self-styled Death Speaker, Jargba interprets the will of ancient quillboar spirits. He necromantically binds the bones of fallen clan members to his side, forging an army of skeletal minions. Jargba’s chilling incantations echo through the Kraul, promising immortal power- and eternal torment- for those who cross him.
                        ]]
        },
        {
            bossID = 4842,
            spells = {},
            name = "Earthcaller Halmgar",
            story = [[
            Halmgar draws upon elemental forces to stir the ground beneath Razorfen Kraul. Earthquakes and fissures follow him as he treads the winding caverns. Whispers say he bargains with primordial spirits, offering flesh-and-blood sacrifices to secure the elements’ destructive favor against any who would threaten quillboar dominion.
                        ]]
        },
        {
            bossID = 6168,
            spells = {},
            name = "Roogug",
            story = [[
            Roogug is a twisted shaman who experiments with nature’s darkest aspects, warping fauna and fauna alike. Quillboar revere him as a visionary, though the abominations that scuttle in his chambers suggest otherwise. Roogug’s experiments often end in explosions of fel-green spores, as he desperately searches for new ways to strengthen his kin.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 110001, 110501, 124001, 106501, 111001, 149501, 117501, 150001, 150501, 108001, 151001, 151501, 887501, 888001, 154501, 155001, 155501, 100001, 112001, 152001, 152501, 116001, 153001, 153501, 154001 },
    droplocation = { [[Roogug]], [[Roogug]], [[Roogug]], [[Aggem Thorncurse]], [[Aggem Thorncurse]], [[Aggem Thorncurse]], [[Death Speaker Jargba]], [[Death Speaker Jargba]], [[Death Speaker Jargba]], [[Overlord Ramtusk]], [[Overlord Ramtusk]], [[Overlord Ramtusk]], [[Earthcaller Halmgar]], [[Earthcaller Halmgar]], [[Blind Hunter]], [[Blind Hunter]], [[Blind Hunter]], [[Agathelos the Raging]], [[Agathelos the Raging]], [[Agathelos the Raging]], [[Agathelos the Raging]], [[Charlga Razorflank]], [[Charlga Razorflank]], [[Charlga Razorflank]], [[Charlga Razorflank]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Razorfen Downs",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RazorfenDowns.blp",
    bosses = {
        {
            bossID = 7354,
            spells = {},
            name = "Ragglesnout",
            story = [[
            Ragglesnout was once a cunning quillboar champion who ventured beyond the spires of Razorfen. Infected by the Scourge’s undead plague, he returned as a rotting monstrosity. His mind clouded by decay, he roams the crypts, thirsting for living flesh- an unholy testament to the horrors that now grip these halls.
                        ]]
        },
        {
            bossID = 7355,
            spells = {},
            name = "Tuten'kash",
            story = [[
            A colossal crypt fiend, Tuten’kash lurks in a sealed burial chamber. The quillboar discovered and bound it to guard their ancestral dead, but necromantic corruption has twisted its purpose. Wrapped in funeral bandages, Tuten’kash strikes from darkness with venomous fangs, claiming fresh corpses for its growing brood.
                        ]]
        },
        {
            bossID = 7356,
            spells = {},
            name = "Plaguemaw the Rotting",
            story = [[
            Plaguemaw earned his dreadful epithet by cultivating a strain of blight so virulent it decayed even quillboar brambles. Rot seeps from his maw, spreading fast through any it touches. This living plague dog hunts in the labyrinth, devouring flesh and turning the remains into a festering ground for more corruption.
                        ]]
        },
        {
            bossID = 7357,
            spells = {},
            name = "Mordresh Fire Eye",
            story = [[
            Mordresh Fire Eye was once a powerful necrolyte experimenting with flame-infused necromancy. His obsession backfired, burning away his mortal shell. Now, as a blazing skeletal figure, he roams the Bone Pile, summoning flames of undeath and raining fiery bone shards upon those who dare challenge his domain.
                        ]]
        },
        {
            bossID = 7358,
            spells = {},
            name = "Amnennar the Coldbringer",
            story = [[
            Amnennar is a lich of the Scourge, tasked with raising an undead army from the quillboar crypts. He radiates an aura of frozen death that chills the very air. In the heart of Razorfen Downs, he summons bone-chilling winds and legions of mindless minions, intent on spreading the Lich King’s will.
                        ]]
        },
        {
            bossID = 8567,
            spells = {},
            name = "Glutton",
            story = [[
            Glutton was a mindless beast that gorged on the dead left behind by the undead invasion. Over time, necromantic energies twisted it into a voracious abomination of teeth and stomach. It prowls the dark passages, consuming anything that moves- living or undead- driven solely by endless hunger.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 222501, 238001, 238501, 239001, 222001, 224001, 231001, 234001, 224501, 235501, 236001, 236501, 225001, 225501, 230501, 234501, 235001, 221501, 223001, 223501, 237001, 237501, 231501, 232001, 232501, 233001, 233501 },
    droplocation = { [[Tuten'kash]], [[Tuten'kash]], [[Tuten'kash]], [[Tuten'kash]], [[Plaguemaw the Rotting]], [[Plaguemaw the Rotting]], [[Plaguemaw the Rotting]], [[Plaguemaw the Rotting]], [[Mordresh Fire Eye]], [[Mordresh Fire Eye]], [[Mordresh Fire Eye]], [[Mordresh Fire Eye]], [[Ragglesnout]], [[Ragglesnout]], [[Ragglesnout]], [[Ragglesnout]], [[Ragglesnout]], [[Glutton]], [[Glutton]], [[Glutton]], [[Glutton]], [[Glutton]], [[Amnennar the Coldbringer]], [[Amnennar the Coldbringer]], [[Amnennar the Coldbringer]], [[Amnennar the Coldbringer]], [[Amnennar the Coldbringer]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Maraudon",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Maraudon.blp",
    bosses = {
        {
            bossID = 12201,
            spells = {},
            name = "Princess Theradras",
            story = [[
            Princess Theradras, daughter of Therazane the Stonemother, stands as the elemental protector of Maraudon. Twisted love bound her to Zaetar, a demigod, and birthed the centaur race. Grief and fury at Zaetar’s death drove her mad, causing her to channel raw earth magic in violent outbursts, reshaping the caverns around her.
                        ]]
        },
        {
            bossID = 12203,
            spells = {},
            name = "Landslide",
            story = [[
            Landslide is an earth elemental lieutenant summoned by Theradras to guard her inner sanctum. Towering and unyielding, it shifts the ground with every step. Wherever it passes, walls crumble, tunnels collapse, and unwary adventurers find themselves buried under living stone, unable to challenge the Princess’s domain.
                        ]]
        },
        {
            bossID = 12225,
            spells = {},
            name = "Celebras the Cursed",
            story = [[
            Celebras was a noble Keeper of the Grove, protecting Maraudon’s lush secrets. Corruption took root when he delved too deeply into the caverns, warping his druidic powers. Now cursed, he roams the hidden grottos, conjuring twisted flora and enslaving elemental spirits to maintain a warped vision of nature’s harmony.
                        ]]
        },
        {
            bossID = 12236,
            spells = {},
            name = "Lord Vyletongue",
            story = [[
            A satyr who revels in chaos, Lord Vyletongue manipulates the arcane energies coursing through Maraudon’s hidden springs. He thrives on pitting the elemental forces against each other, fueling the strife that saturates these caverns. His venomous spells corrode mind and body, leaving foes delirious and powerless.
                        ]]
        },
        {
            bossID = 12237,
            spells = {},
            name = "Meshlok the Harvester",
            story = [[
            Meshlok lurks in flooded tunnels, an elemental horror born of polluted waters. Dripping with corrupt algae, it slithers through submerged caverns, suffocating intruders in tangles of slime. Some believe Meshlok is the result of centuries of toxic run-off merging with primordial elemental essence, making it a living vortex of decay.
                        ]]
        },
        {
            bossID = 12258,
            spells = {},
            name = "Razorlash",
            story = [[
            Razorlash is a carnivorous plant grown monstrous in Maraudon’s arcane bloom. Its tendrils snare and shred, while acid-laced petals devour intruders. Legend says the seed that birthed Razorlash was watered with the tears of a corrupted dryad, granting this plant-like monstrosity a thirst for druidic blood.
                        ]]
        },
        {
            bossID = 13282,
            spells = {},
            name = "Noxxion",
            story = [[
            Noxxion is a being of living poison, an elemental of corruption taking form in the nexus of foul waters. Swarms of toxic droplets orbit his sludge-like core, dissolving anything they touch. He mindlessly seeks to spread contamination, unaware of purpose beyond the relentless urge to pollute all living things.
                        ]]
        },
        {
            bossID = 13596,
            spells = {},
            name = "Rotgrip",
            story = [[
            Rotgrip was once a peaceful crocolisk, until it gorged on tainted fungal blooms growing near the caverns. Now, swollen and mutated by primal energies, it patrols the muddy banks and watery tunnels. Its jaws can crush stone, and its appetite is insatiable- a living hazard to those who wander near the lakes.
                        ]]
        },
        {
            bossID = 13601,
            spells = {},
            name = "Tinkerer Gizlock",
            story = [[
            Gizlock is a goblin inventor who sought profit in Maraudon’s hidden resources. Driven half-mad by the caverns’ malevolent forces, he rigs contraptions infused with wild elemental energies. Though unhinged, he remains fiercely clever, using explosives and gadgets to protect his newfound domain- and his ambitious schemes.
                        ]]
        },
    },
    versions = mp_versions,
    specialItems = { 9399 },
    specialDrop = { [[Baelog]] },
    items = { 507001, 507501, 508001, 508501, 509001, 509501, 510001, 510501, 511001, 511501, 768501, 769001, 769501, 505501, 506001, 506501, 504001, 504501, 505001, 512501, 498501, 501001, 501501, 502001, 499001, 502501, 503001, 503501, 498001, 499501, 500001, 500501, 512001, 770001 },
    droplocation = { [[Noxxion]], [[Noxxion]], [[Noxxion]], [[Razorlash]], [[Razorlash]], [[Razorlash]], [[Razorlash]], [[Lord Vyletongue]], [[Lord Vyletongue]], [[Lord Vyletongue]], [[Meshlok the Harvester]], [[Meshlok the Harvester]], [[Meshlok the Harvester]], [[Celebras the Cursed]], [[Celebras the Cursed]], [[Celebras the Cursed]], [[Landslide]], [[Landslide]], [[Landslide]], [[Landslide]], [[Tinkerer Gizlock]], [[Tinkerer Gizlock]], [[Tinkerer Gizlock]], [[Tinkerer Gizlock]], [[Rotgrip]], [[Rotgrip]], [[Rotgrip]], [[Rotgrip]], [[Princess Theradras]], [[Princess Theradras]], [[Princess Theradras]], [[Princess Theradras]], [[Princess Theradras]], [[Princess Theradras]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Uldaman",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Uldaman.blp",
    bosses = {
        {
            bossID = 2748,
            spells = {},
            name = "Archaedas",
            story = [[
            Archaedas, the ancient Stone Watcher, was created by the Titans to safeguard Uldaman’s greatest secrets. Dormant for millennia, he awakens to defend the vaults from any who would disturb them. His rumbling commands stir earthen constructs to life, unleashing the unstoppable might of Titan-forged stone upon intruders.
                        ]]
        },
        {
            bossID = 4854,
            spells = {},
            name = "Grimlok",
            story = [[
            Grimlok, a trogg chieftain, discovered half-buried Titan relics in these halls. Empowered by the faint Titan magic, he leads trogg raids against explorers who dare approach. Though he may not fully grasp the artifacts’ significance, his newfound strength and savage cunning pose a dire threat to any archaeologist’s expedition.
                        ]]
        },
        {
            bossID = 6906,
            spells = {},
            name = "Baelog",
            story = [[
            Baelog is a brave yet brash dwarf explorer, part of a trio delving into Uldaman. He wields a rifle and an adventurous spirit in equal measure. Stubborn to a fault, Baelog’s unwavering determination to unearth Titan secrets often places him directly in harm’s way- yet he never backs down from a challenge.
                        ]]
        },
        {
            bossID = 6907,
            spells = {},
            name = "Eric The Swift",
            story = [[
            Eric the Swift is the fleet-footed, axe-wielding companion of Baelog and Olaf. Renowned for his lightning-quick reflexes, he uses speed to outmaneuver troggs and golems alike. In pursuit of ancient lore, Eric’s curiosity pushes him ever deeper into Titan vaults, though he must constantly dance between traps and trogg ambushes.
                        ]]
        },
        {
            bossID = 6908,
            spells = {},
            name = "Olaf",
            story = [[
            Olaf is the sturdy shield-bearer of the famed dwarven trio. Quiet but steadfast, he soaks up blows that would fell lesser dwarves. While Baelog prods troggs from afar and Eric flanks them in a flurry, Olaf holds firm at the center of the fray, reflecting his unbreakable loyalty to his companions- and to dwarven honor.
                        ]]
        },
        {
            bossID = 6910,
            spells = {},
            name = "Revelosh",
            story = [[
            Revelosh, once a Titan researcher, was driven mad by years of isolation in Uldaman’s twisting corridors. Now, enthralled by relics he barely comprehends, he sees himself as their guardian. His savage thirst for knowledge leads him to attack intruders, convinced they mean to steal the artifacts that have become his obsession.
                        ]]
        },
        {
            bossID = 7023,
            spells = {},
            name = "Obsidian Sentinel",
            story = [[
            The Obsidian Sentinel is a formidable construct carved from obsidian and Titan metals. Activated to protect Uldaman’s hidden chambers, it absorbs magical energy to fuel its basalt-like skin. Rumor has it that those who manage to scratch its surface only strengthen its defensive wards, making it nigh invulnerable.
                        ]]
        },
        {
            bossID = 7206,
            spells = {},
            name = "Ancient Stone Keeper",
            story = [[
            Entombed in Uldaman’s innermost halls, the Ancient Stone Keeper is a colossus of living rock. Lethargic in slumber, it emerges from the shadows when the vault’s sanctity is threatened. Entire corridors collapse under its stomps. Some dwarves suspect it was once a sentinel for lost Titan secrets predating mortal civilization.
                        ]]
        },
        {
            bossID = 7228,
            spells = {},
            name = "Ironaya",
            story = [[
            Ironaya is a majestic Titan construct forged to oversee Uldaman’s architecture. Her stoic grace belies immense power. When awakened, she sweeps through corridors like a living statue come to life. Legends say her presence hints at the Titan’s grand design for Azeroth, though she offers no answers- only stone-cold judgment.
                        ]]
        },
        {
            bossID = 7291,
            spells = {},
            name = "Galgann Firehammer",
            story = [[
            A Dark Iron dwarf who infiltrated Uldaman seeking Titan-forged weaponry, Galgann Firehammer harnesses pyrotechnic mastery to scorch foes. Obsessed with overshadowing the Bronzebeard clan’s claims to Titan heritage, he unleashes blasts of flame and molten metal, determined to seize any relic that will grant him the upper hand.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 183001, 183501, 184001, 184501, 186501, 187001, 185501, 186001, 187501, 188001, 188501, 189001, 189501, 182501, 194501, 197001, 185001, 190001, 190501, 191001, 194001, 256501, 257001, 192001, 193001, 195001, 191501, 193501, 195501, 255501 },
    droplocation = { [[Revelosh]], [[Revelosh]], [[Revelosh]], [[Revelosh]], [[Baelog]], [[Baelog]], [[Eric "The Swift"]], [[Eric "The Swift"]], [[Olaf]], [[Olaf]], [[Ironaya]], [[Ironaya]], [[Obsidian Sentinel]], [[Obsidian Sentinel]], [[Obsidian Sentinel]], [[Ancient Stone Keeper]], [[Ancient Stone Keeper]], [[Ancient Stone Keeper]], [[Galgann Firehammer]], [[Galgann Firehammer]], [[Galgann Firehammer]], [[Galgann Firehammer]], [[Grimlok]], [[Grimlok]], [[Grimlok]], [[Grimlok]], [[Archaedas]], [[Archaedas]], [[Archaedas]], [[Archaedas]] }
})

table.insert(_G.Valanior.djDungeons, {
    name = "Zul'Farrak",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ZulFarrak.blp",
    bosses = {
        {
            bossID = 7267,
            spells = {},
            name = "Chief Ukorz Sandscalp",
            story = [[
            Chief Ukorz Sandscalp rules the sand-swept city of Zul’Farrak with iron discipline. Once a minor chieftain, he rose to power by uniting warring troll factions under promises of wealth and vengeance. He now orchestrates elaborate sacrifices to the desert spirits and personally leads raids against any who trespass on troll lands.
                        ]]
        },
        {
            bossID = 7271,
            spells = {},
            name = "Witch Doctor Zum'rah",
            story = [[
            Zum’rah is a twisted witch doctor who manipulates dark voodoo to raise zombified troll minions. His experiments push the boundaries between life and death, enthralling restless spirits. Fiercely protective of Zul’Farrak’s sacred grounds, Zum’rah curses intruders, ensuring their souls remain forever bound to the sands.
                        ]]
        },
        {
            bossID = 7272,
            spells = {},
            name = "Theka the Martyr",
            story = [[
            Known as the Martyr for his stoic endurance of dreadful curses, Theka remains unwaveringly faithful to Zul’Farrak’s ancient Loa. Some say he willingly absorbed a legion of hexes meant for his people. Though these curses left him partially mummified, he draws on them in combat, unleashing plagues upon the unworthy.
                        ]]
        },
        {
            bossID = 7273,
            spells = {},
            name = "Gahz'rilla",
            story = [[
            A colossal hydra revered by the trolls as a child of their primal gods, Gahz’rilla slumbers beneath the sands until summoned by an elaborate gong ritual. When awakened, it thrashes through dunes and pyramids alike, devouring any who stand against the savage might of Zul’Farrak’s faith.
                        ]]
        },
        {
            bossID = 7275,
            spells = {},
            name = "Shadowpriest Sezz'ziz",
            story = [[
            Shadowpriest Sezz’ziz manipulates the darkest energies of Zul’Farrak’s pantheon, weaving shadows into potent curses. His obsidian staff crackles with forbidden magic. Whispers claim he communes with ancient troll spirits that dwell just beyond mortal sight, commanding them to torment intruders with illusions and nightmares.
                        ]]
        },
        {
            bossID = 7795,
            spells = {},
            name = "Hydromancer Velratha",
            story = [[
            Velratha’s mastery of water magic is infamous among desert trolls. She can draw moisture from the very air to flood entire corridors or create slicing jets of pressurized water. Torn between worship of the Loa and personal ambition, Velratha tests her powers on adventurers who dare breach Zul’Farrak’s sanctum.
                        ]]
        },
        {
            bossID = 7796,
            spells = {},
            name = "Nekrum Gutchewer",
            story = [[
            Nekrum is a fierce cannibal known for devouring the hearts of his enemies to gain their strength. Tasked by Ukorz Sandscalp with overseeing sacrificial ceremonies, Nekrum revels in bloodshed, believing each conquest honors the Loa. His savage roars echo over sacrificial altars, intimidating foes before the fight even begins.
                        ]]
        },
        {
            bossID = 7797,
            spells = {},
            name = "Ruuzlu",
            story = [[
            Ruuzlu is Chief Ukorz’s loyal bodyguard, a powerful troll warrior with arms scarred from countless battles. Though often silent, he leaps into the fray with unstoppable ferocity the moment Ukorz’s command is given. The only thing stronger than Ruuzlu’s blade is his devotion to his chieftain.
                        ]]
        },
        {
            bossID = 8127,
            spells = {},
            name = "Antu'sul",
            story = [[
            A sand-shaper who communes with the desert spirits, Antu’sul draws swirling dunes to entomb his foes. He believes the dunes themselves are alive, guided by troll ancestors from ancient times. In ritual dances, he summons living sand elementals, forging them into an army to defend Zul’Farrak’s hidden treasures.
                        ]]
        },
        {
            bossID = 10080,
            spells = {},
            name = "Sandarr Dunereaver",
            story = [[
            Sandarr Dunereaver is a cunning troll raider who once roamed Tanaris collecting tributes for Ukorz. Now stationed within Zul’Farrak, he dispatches hyena packs to track and corner adventurers before leading a swift assault. His knowledge of the dunes is unparalleled, making him a lethal foe in the shifting sands.
                        ]]
        },
        {
            bossID = 10081,
            spells = {},
            name = "Dustwraith",
            story = [[
            A mysterious entity composed of swirling sand and malevolent spirit, the Dustwraith drifts through half-buried corridors. Some say it’s the wrathful ghost of a troll mage lost in a desert storm. Its form constantly shifts, making it nearly impervious to blades. Adventurers trapped in its vortex seldom escape unscathed.
                        ]]
        },
        {
            bossID = 10082,
            spells = {},
            name = "Zerillis",
            story = [[
            Zerillis is an elusive huntress believed to be the offspring of a mortal troll and a desert spirit. She appears and vanishes amid the dunes, attacking with scything claws and hurling sand-laced hexes. Troll legends say she guards lost tombs deeper in the desert, but none who follow her ever return.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 182001, 214501, 215001, 215501, 133001, 196001, 196501, 114001, 515001, 515501, 104001, 113501, 177501, 204501, 205001, 205501, 206001, 206501, 207001, 176001, 179501, 180501, 111501, 175001, 178501, 304501, 304001, 207501, 208001, 208501, 209001, 255001 },
    droplocation = { [[Antu'sul]], [[Antu'sul]], [[Antu'sul]], [[Antu'sul]], [[Theka the Martyr]], [[Theka the Martyr]], [[Theka the Martyr]], [[Witch Doctor Zum'rah]], [[Witch Doctor Zum'rah]], [[Witch Doctor Zum'rah]], [[Nekrum Gutchewer]], [[Nekrum Gutchewer]], [[Nekrum Gutchewer]], [[Gahz'rilla]], [[Gahz'rilla]], [[Shadowpriest Sezz'ziz]], [[Shadowpriest Sezz'ziz]], [[Shadowpriest Sezz'ziz]], [[Shadowpriest Sezz'ziz]], [[Sergeant Bly]], [[Sergeant Bly]], [[Sergeant Bly]], [[Hydromancer Velratha]], [[Hydromancer Velratha]], [[Hydromancer Velratha]], [[Dustwraith]], [[Zerillis]], [[Chief Ukorz Sandscalp]], [[Chief Ukorz Sandscalp]], [[Chief Ukorz Sandscalp]], [[Chief Ukorz Sandscalp]], [[Chief Ukorz Sandscalp]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Stratholme",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Stratholme.blp",
    bosses = {
        {
            bossID = 10435,
            spells = {},
            name = "Magistrate Barthilas",
            story = [[
            Once a respected city official, Magistrate Barthilas was driven mad by the horrors unleashed upon Stratholme. Turning fanatic in a desperate bid to save his people, he imprisoned and executed countless infected. Now twisted into an undead horror himself, Barthilas patrols the burning streets, haunted by the atrocities he committed.
                        ]]
        },
        {
            bossID = 10436,
            spells = {},
            name = "Baroness Anastari",
            story = [[
            A powerful banshee, Baroness Anastari was once a noble allied with Arthas during his campaign. In undeath, her shrieking voice tears at the souls of the living. She roams Stratholme’s rubble-strewn halls, enthralling those who wander too near with spectral illusions, forced to relive the city’s downfall over and over.
                        ]]
        },
        {
            bossID = 10437,
            spells = {},
            name = "Nerub'enkan",
            story = [[
            Nerub’enkan is a monstrous spider from the fallen kingdom of Azjol-Nerub, driven to Stratholme by the Scourge. Weaving webs of corrupted silk, it nests in the city’s twisted architecture. The creature’s chittering brood spreads plague and webs, ensnaring intruders in sticky labyrinths beneath the city’s flaming skyline.
                        ]]
        },
        {
            bossID = 10438,
            spells = {},
            name = "Maleki the Pallid",
            story = [[
            Maleki was a necromancer tasked with perfecting vile plagues within the city’s crypts. His success cost him his humanity: pale flesh stretched tight over bones, a testament to the poisons roiling in his veins. He manipulates shadows and toxins to torment foes, seeking fresh test subjects for his endless experiments.
                        ]]
        },
        {
            bossID = 10439,
            spells = {},
            name = "Ramstein the Gorger",
            story = [[
            Ramstein the Gorger is a gargantuan abomination stitched together from countless corpses. A savage guardian of Stratholme’s central plaza, Ramstein wields unspeakable strength, flattening anything in his path. Created by the city’s necromancers, it stands as a looming symbol of the Scourge’s brutal craftsmanship.
                        ]]
        },
        {
            bossID = 10440,
            spells = {},
            name = "Baron Rivendare",
            story = [[
            Baron Rivendare commands the Scourge forces in Stratholme, a once-pious noble turned death knight under the Lich King. From atop his dread steed, he orchestrates the city’s perpetual torment, raising new undead legions from the ashes. Those who challenge him face the unholy might of one of the Scourge’s most feared champions.
                        ]]
        },
        {
            bossID = 10516,
            spells = {},
            name = "The Unforgiven",
            story = [[
            This wailing specter is all that remains of a Stratholme citizen consumed by guilt. Torn between relief and despair, The Unforgiven wanders the city, howling accusations at any living soul. She unleashes waves of sorrow that drain courage and life, compelling her victims to join her in unending regret.
                        ]]
        },
        {
            bossID = 10558,
            spells = {},
            name = "Hearthsinger Forresten",
            story = [[
            Hearthsinger Forresten was the last joyful voice in Stratholme- a wandering minstrel who refused to abandon the city. Tragically, the plague took him mid-song. Now an undead troubadour, he prowls the cursed streets, playing haunting tunes on his broken lute, enthralling listeners and summoning restless spirits to his grim chorus.
                        ]]
        },
        {
            bossID = 10808,
            spells = {},
            name = "Timmy the Cruel",
            story = [[
            Timmy was once a gentle giant with diminished wits, easily manipulated by the Scourge. Transformed into a hulking ghoul, he lumbers through the streets under necromancer commands. Despite his imposing figure and savage attacks, echoes of the kind soul he once possessed sometimes flicker behind his vacant gaze.
                        ]]
        },
        {
            bossID = 10809,
            spells = {},
            name = "Stonespine",
            story = [[
            Stonespine is a rare, skeletal chimera that somehow found its way into Stratholme’s crypts. The necromantic energies saturating the city animate its bony frame, making it nigh invincible. With each rattle of its spine, it summons swirling bone shards, tearing through flesh as though it hunts in life once more.
                        ]]
        },
        {
            bossID = 10811,
            spells = {},
            name = "Archivist Galford",
            story = [[
            Archivist Galford was devoted to preserving Stratholme’s heritage. When the Scourge overran the city, he tried to protect the last tomes of knowledge. In undeath, he guards smoldering libraries, incinerating intruders with arcane flames. Every burned page fuels his torment, driving him to further acts of pyromania.
                        ]]
        },
        {
            bossID = 10812,
            spells = {},
            name = "Grand Crusader Dathrohan",
            story = [[
            Dathrohan was a revered paladin who led a contingent of the Scarlet Crusade into Stratholme. But unbeknownst to all, his body was possessed by the dreadlord Balnazzar, who uses Dathrohan’s form to manipulate the Crusade’s zeal. He feigns piety while plotting the Crusade’s downfall and furthering the Burning Legion’s agenda.
                        ]]
        },
        {
            bossID = 10997,
            spells = {},
            name = "Cannon Master Willey",
            story = [[
            Willey was a siege engineer obsessed with controlling Stratholme’s artillery. Even as the city crumbled, he refused to relinquish his post. In death, he lingers in the square, firing plague-laced cannonballs at any survivors. His unnerving laughter rings out over the thunder of cannons echoing in the haunted streets.
                        ]]
        },
        {
            bossID = 11032,
            spells = {},
            name = "Malor the Zealous",
            story = [[
            A devout Scarlet Crusader, Malor the Zealous marched into Stratholme convinced he could purge it in righteous fire. Instead, the city’s horrors consumed his squad. Undeterred, Malor fights on with fanatic resolve, believing the Light will eventually deliver him from the undead’s clutches- even if he must burn everything else first.
                        ]]
        },
        {
            bossID = 11058,
            spells = {},
            name = "Fras Siabi",
            story = [[
            Fras Siabi was once a famous cigar merchant whose wares were renowned across Lordaeron. When the Scourge arrived, he refused to abandon his store. Now undead, he prowls the ruined marketplace, still clinging to dusty boxes of cigars. Black smoke billows from his presence, choking all who wander too close.
                        ]]
        },
        {
            bossID = 11121,
            spells = {},
            name = "Black Guard Swordsmith",
            story = [[
            This swordsmith was commissioned by Arthas himself to forge weapons in preparation for purging Stratholme. In undeath, he continues his craft, hammering soul-infused steel that resonates with dark energy. Each blade he forges is a masterpiece of malevolence, tested on the unfortunate living souls who cross his path.
                        ]]
        },
        {
            bossID = 11143,
            spells = {},
            name = "Postmaster Malown",
            story = [[
            Postmaster Malown was Stratholme’s loyal courier, determined to deliver critical messages even as the city fell. Undeath found him tirelessly patrolling his old routes, carrying sacks of cursed letters. Those who intercept his deliveries face phantom mail that saps hope, reminding them of the city’s doomed past.
                        ]]
        },
    },
    versions = mp_versions,
    specialItems = { 12839, 13377, 18783, 12833, 13335, 13520, 14512 },
    specialDrop = { [[Cannon Master Willey]], [[Cannon Master Willey]], [[Black Guard Swordsmith]], [[Maleki the Pallid]], [[Baron Rivendare]], [[Balnazzar]], [[Balnazzar]] },
    items = { 593001, 593501, 655001, 659501, 370001, 370501, 371001, 583501, 363001, 365001, 365501, 658501, 375001, 375501, 376001, 376501, 367001, 367501, 368001, 368501, 369001, 369501, 357001, 373001, 373501, 374001, 374501, 358001, 358501, 483001, 592501, 657501, 363501, 364001, 364501, 658001, 659001, 300501, 356501, 366001, 366501, 581501, 770501, 357501, 360001, 582001, 582501, 583001, 362501, 584001, 584501, 585501, 586001, 371501, 372501, 384001, 585001, 662001, 379501, 590001, 590501, 591001, 660501, 355001, 589001, 591501, 592001, 661001, 354501, 379001, 588001, 588501, 589501, 380001, 586501, 587001, 587501, 661501, 360501, 361001, 361501, 362001, 378501, 355501, 356001, 359001, 359501, 378001, 660001 },
    droplocation = { [[Ezra Grimm]], [[Ezra Grimm]], [[Ezra Grimm]], [[Ezra Grimm]], [[Skul]], [[Skul]], [[Skul]], [[Skul]], [[Hearthsinger Forresten]], [[Hearthsinger Forresten]], [[Hearthsinger Forresten]], [[Hearthsinger Forresten]], [[The Unforgiven]], [[The Unforgiven]], [[The Unforgiven]], [[The Unforgiven]], [[Postmaster Malown]], [[Postmaster Malown]], [[Postmaster Malown]], [[Postmaster Malown]], [[Postmaster Malown]], [[Postmaster Malown]], [[Timmy the Cruel]], [[Timmy the Cruel]], [[Timmy the Cruel]], [[Timmy the Cruel]], [[Timmy the Cruel]], [[Malor the Zealous]], [[Malor the Zealous]], [[Malor the Zealous]], [[Malor the Zealous]], [[Malor the Zealous]], [[Cannon Master Willey]], [[Cannon Master Willey]], [[Cannon Master Willey]], [[Cannon Master Willey]], [[Cannon Master Willey]], [[Archivist Galford]], [[Archivist Galford]], [[Archivist Galford]], [[Archivist Galford]], [[Archivist Galford]], [[Balnazzar]], [[Balnazzar]], [[Balnazzar]], [[Balnazzar]], [[Balnazzar]], [[Balnazzar]], [[Magistrate Barthilas]], [[Magistrate Barthilas]], [[Magistrate Barthilas]], [[Magistrate Barthilas]], [[Magistrate Barthilas]], [[Stonespine]], [[Stonespine]], [[Stonespine]], [[Stonespine]], [[Stonespine]], [[Nerub'enkan]], [[Nerub'enkan]], [[Nerub'enkan]], [[Nerub'enkan]], [[Nerub'enkan]], [[Black Guard Swordsmith]], [[Black Guard Swordsmith]], [[Black Guard Swordsmith]], [[Black Guard Swordsmith]], [[Black Guard Swordsmith]], [[Maleki the Pallid]], [[Maleki the Pallid]], [[Maleki the Pallid]], [[Maleki the Pallid]], [[Maleki the Pallid]], [[Baroness Anastari]], [[Baroness Anastari]], [[Baroness Anastari]], [[Baroness Anastari]], [[Baroness Anastari]], [[Ramstein the Gorger]], [[Ramstein the Gorger]], [[Ramstein the Gorger]], [[Ramstein the Gorger]], [[Ramstein the Gorger]], [[Baron Rivendare]], [[Baron Rivendare]], [[Baron Rivendare]], [[Baron Rivendare]], [[Baron Rivendare]], [[Baron Rivendare]] }
})
--###############################
--## TODO - REFORM DROPTABLE
--###############################
table.insert(_G.Valanior.djDungeons, {
    name = "Sunken Temple",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SunkenTemple.blp",
    bosses = {
        {
            bossID = 5708,
            spells = {},
            name = "Spawn of Hakkar",
            story = [[
            A lesser incarnation of the Blood God Hakkar, this winged terror prowls the Temple’s crumbling corridors. Its screeches echo through flooded halls, heralding dread illusions and vampiric attacks. Though weaker than its progenitor, the Spawn of Hakkar still thirsts for living essence to fuel its dark master’s revival.
                        ]]
        },
        {
            bossID = 5709,
            spells = {},
            name = "Shade of Eranikus",
            story = [[
            The once-noble green dragon Eranikus was corrupted by the Emerald Nightmare. His spirit lingers within the sunken temple, shackled to the dark magic that seeps through its walls. Wracked by madness, his shade lashes out at intruders, a tragic reminder of the Dream’s power to twist even the mightiest beings.
                        ]]
        },
        {
            bossID = 5710,
            spells = {},
            name = "Jammal'an the Prophet",
            story = [[
            Jammal’an leads the Atal’ai trolls in worship of Hakkar, orchestrating vile rituals to hasten their blood god’s return. A twisted zealot, he channels shadowy hexes and illusions. His whispered prophecies echo through the Temple, promising unspeakable power to those who devote themselves to Hakkar’s cause.
                        ]]
        },
        {
            bossID = 5711,
            spells = {},
            name = "Ogom the Wretched",
            story = [[
            A troll so consumed by Hakkar’s dark influence that he no longer recognizes his own reflection, Ogom mutters cryptic verses while carving blood-tinged runes into stone altars. The Temple’s energies swirl around him, fueling his hexes. In his single-minded devotion, he’ll sacrifice anything- and anyone- to see Hakkar reborn.
                        ]]
        },
        {
            bossID = 5712,
            spells = {},
            name = "Zolo",
            story = [[
            Zolo is an Atal’ai zealot renowned for his brutal methods, dragging captured explorers into sacrificial pits. He scrawls bloody wards on the temple walls to strengthen Hakkar’s influence. Armed with a wicked blade and cruel determination, he views each slain foe as a blood offering in the name of the Blood God.
                        ]]
        },
        {
            bossID = 5713,
            spells = {},
            name = "Gasher",
            story = [[
            Gasher embodies the primal cruelty of the Atal’ai. He tears through the Temple with terrifying speed, wielding twin daggers to deadly effect. Gasher prefers quick, brutal strikes rather than drawn-out rituals- yet he revels in the shrieks echoing off flooded pillars, proof that Hakkar’s presence lingers here.
                        ]]
        },
        {
            bossID = 5714,
            spells = {},
            name = "Loro",
            story = [[
            A devout Atal’ai warrior, Loro channels the savage spirits of ancient troll ancestors, unleashing them in flurries of raw power. He remains unwavering in the face of any odds, believing every fallen intruder is one step closer to Hakkar’s glorious resurrection. Each battle-scar is a testament to his unwavering faith.
                        ]]
        },
        {
            bossID = 5715,
            spells = {},
            name = "Hukku",
            story = [[
            Hukku harnesses the Temple’s labyrinthine acoustics to chant vile incantations. Each resonant note amplifies Hakkar’s hold, distorting minds caught in the swirling echoes. Rumor has it he once silenced an entire expedition with a single chant that plunged them into madness, their screams lost in the watery depths.
                        ]]
        },
        {
            bossID = 5716,
            spells = {},
            name = "Zul'Lor",
            story = [[
            Zul’Lor is the enforcer of the Atal’ai, famed for wrestling beasts in the swamp before he joined the cult. He now uses that brute strength to crush foes and protect the temple’s darkest secrets. At Hakkar’s beckoning, Zul’Lor becomes an unstoppable force of violence, his roars resounding through ancient corridors.
                        ]]
        },
        {
            bossID = 5717,
            spells = {},
            name = "Mijan",
            story = [[
            A once-holy troll priestess, Mijan’s faith was perverted under the Atal’ai’s influence. She now channels twisted blessings of blood to bolster her fanatic brethren. The swirling waters at her feet sometimes glow with dark energies, reminiscent of the blessings of Hakkar- corrupted miracles that turn healing into torment.
                        ]]
        },
        {
            bossID = 5719,
            spells = {},
            name = "Morphaz",
            story = [[
            One of the drakes corrupted alongside Eranikus, Morphaz wields potent green dragonflight magic. Twisting illusions and poison-laced breath, Morphaz hunts in the Temple’s murky heights. Traces of the Emerald Dream cling to his scales, an eerie reminder that the line between dream and nightmare can be razed by corruption.
                        ]]
        },
        {
            bossID = 5720,
            spells = {},
            name = "Weaver",
            story = [[
            Weaver shares Morphaz’s tainted lineage, weaving powerful arcane spells that warp the fabric of the Temple’s reality. Dark currents swirl at his claws, reminiscent of the Dream’s fracturing. Even in draconic madness, Weaver calculates each strike, testing intruders’ resolve as if measuring them for an even darker purpose.
                        ]]
        },
        {
            bossID = 5721,
            spells = {},
            name = "Dreamscythe",
            story = [[
            Dreamscythe roams the Temple’s hidden spires, bathed in shifting emerald auras. Twisted by the Nightmare, this drake slashes at perceptions as much as flesh, plunging foes into hallucinatory illusions. A single flap of his wings can whip up illusions that linger in the corridors long after he’s vanished into shadows.
                        ]]
        },
        {
            bossID = 5722,
            spells = {},
            name = "Hazzas",
            story = [[
            Hazzas completes the quartet of corrupted drakes, each representing a piece of Eranikus’s splintered soul. Harnessing raw chaos, Hazzas conjures nightmares that shatter adventurers’ wills. His roars reverberate like thunder in the temple’s echoing chambers, evoking primal terror that disrupts any hope of calm or strategy.
                        ]]
        },
        {
            bossID = 8440,
            spells = {},
            name = "Shade of Hakkar",
            story = [[
            A spectral echo of the Blood God, the Shade of Hakkar materializes when vile rituals near completion. Its presence warps reality, a dire warning of Hakkar’s potential return. Troll cultists frantically protect this manifestation, believing it the herald of their deity’s full rebirth- while outsiders scramble to banish it before it grows.
                        ]]
        },
        {
            bossID = 8580,
            spells = {},
            name = "Atal'alarion",
            story = [[
            Atal’alarion is an immense stone sentinel molded in Hakkar’s likeness. Awakened by Atal’ai priests, it smashes down intruders with unyielding fists. Each blow reverberates through the temple’s half-flooded halls, a testament to the might the trolls can invoke when they channel their dread god’s power into living stone.
                        ]]
        },
    },
    versions = mp_versions,
    items = { 226001, 244001, 244501, 245001, 226501, 227001, 243501, 303001, 227501, 228001, 242501, 302001, 228501, 247001, 247501, 248001, 245501, 246001, 246501, 253501, 229001, 230001, 243001, 303501, 229501, 252501, 301001, 302501, 251501, 252001, 253001, 254001, 301501, 248501, 249001, 249501, 250001, 250501, 251001, 254501 },
    droplocation = { [[Gasher]], [[Hukku]], [[Loro]], [[Mijan]], [[Zolo]], [[Zul'Lor]], [[Atal'alarion]], [[Atal'alarion]], [[Atal'alarion]], [[Atal'alarion]], [[Dreamscythe]], [[Dreamscythe]], [[Dreamscythe]], [[Dreamscythe]], [[Weaver]], [[Weaver]], [[Weaver]], [[Weaver]], [[Jammal'an the Prophet]], [[Jammal'an the Prophet]], [[Jammal'an the Prophet]], [[Jammal'an the Prophet]], [[Ogom the Wretched]], [[Ogom the Wretched]], [[Ogom the Wretched]], [[Ogom the Wretched]], [[Morphaz]], [[Morphaz]], [[Morphaz]], [[Morphaz]], [[Morphaz]], [[Morphaz]], [[Hazzas]], [[Hazzas]], [[Hazzas]], [[Hazzas]], [[Avatar of Hakkar]], [[Avatar of Hakkar]], [[Avatar of Hakkar]], [[Avatar of Hakkar]], [[Avatar of Hakkar]], [[Shade of Eranikus]], [[Shade of Eranikus]], [[Shade of Eranikus]], [[Shade of Eranikus]], [[Shade of Eranikus]], [[Shade of Eranikus]], [[Shade of Eranikus]] }
})

table.insert(_G.Valanior.djDungeons, {
    name = "Blackrock Depths",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackrockDepths.blp",
    bosses = {
        {
            bossID = 8923,
            spells = {},
            name = "Panzor the Invincible",
            story = [[
            A fabled golem believed to be unbreakable, Panzor was forged by ancient Dark Iron artisans. Its exterior is a fused alloy of enchanted metals, rumored to be impervious to all but the strongest magic. Seen rarely, it awakens in the heart of the Depths when outsiders threaten to disturb the Dark Iron empire’s hidden forges.
                        ]]
        },
        {
            bossID = 8929,
            spells = {},
            name = "Princess Moira Bronzebeard",
            story = [[
            Daughter of King Magni Bronzebeard, Princess Moira was held captive by Emperor Dagran Thaurissan. Swayed- some say brainwashed- by Dark Iron dogma, she believes unifying the Bronzebeard and Dark Iron dwarves is the future of their kind. Though a political prisoner, she wields considerable influence and arcane power to defend her new “home.”
                        ]]
        },
        {
            bossID = 8983,
            spells = {},
            name = "Golem Lord Argelmach",
            story = [[
            An eccentric Dark Iron engineer obsessed with animating stone and metal, Golem Lord Argelmach leads legions of mechanical monstrosities beneath Blackrock. He refines cutting-edge technologies using stolen Ironforge schematics. His workshop crackles with arcane sparks, each experiment more dangerous and unstable than the last.
                        ]]
        },
        {
            bossID = 9016,
            spells = {},
            name = "Bael'Gar",
            story = [[
            Bael’Gar is a colossal elemental bound by the Dark Irons to stoke the black anvils in these fiery depths. Fueled by molten fury, it patrols the deepest magma flows, smashing intruders who interrupt the perpetual forging of Dark Iron weapons. Its roar can melt ore veins and boil blood within seconds.
                        ]]
        },
        {
            bossID = 9017,
            spells = {},
            name = "Lord Incendius",
            story = [[
            Lord Incendius is a blazing elemental commanding the molten rivers of Blackrock Depths. Entrusted with defending the Black Anvil, he conjures infernos to immolate trespassers. His form is living fire, searing the ground beneath his feet. Even the Dark Iron dwarves regard him with caution, for his flames spare no one.
                        ]]
        },
        {
            bossID = 9018,
            spells = {},
            name = "High Interrogator Gerstahn",
            story = [[
            In the dank cells of Blackrock Depths, High Interrogator Gerstahn inflicts twisted cruelties to extract confessions and secrets. Her unwavering loyalty to Emperor Thaurissan is matched only by her sadistic zeal. Adventurers who find themselves in her grasp often wish they had never set foot in the Dark Iron dungeons.
                        ]]
        },
        {
            bossID = 9019,
            spells = {},
            name = "Emperor Dagran Thaurissan",
            story = [[
            Dagran Thaurissan is the iron-fisted ruler of the Dark Iron dwarves. Believing his lineage was wronged by Ironforge, he stands resolute in forging a new empire within the mountain. Armed with destructive runic sorcery and an army of loyal dwarves, Thaurissan defies both dwarven kin and outsiders, determined to shape Azeroth’s destiny from his molten throne.
                        ]]
        },
        {
            bossID = 9024,
            spells = {},
            name = "Pyromancer Loregrain",
            story = [[
            Pyromancer Loregrain is a fanatical fire-wielder who worships Ragnaros’s destructive power. He conducts unholy rites in smoldering sanctums, occasionally self-immolating in a twisted display of devotion. Though overshadowed by greater elemental lords, Loregrain’s mania for fire poses a deadly threat to any who disturb his fervent rituals.
                        ]]
        },
        {
            bossID = 9025,
            spells = {},
            name = "Lord Roccor",
            story = [[
            Lord Roccor is a living boulder once part of the molten crust near the Molten Core. The Dark Irons chained this elemental to guard their domain. Imbued with near-impenetrable stony hide, Roccor smashes foes with colossal fists. Yet behind its silent visage lurks a primal wrath yearning to break free.
                        ]]
        },
        {
            bossID = 9027,
            spells = {},
            name = "Gorosh the Dervish",
            story = [[
            A legendary gladiator, Gorosh the Dervish was captured by the Dark Irons to entertain Emperor Thaurissan in the fight pits. Each day, he battles wave after wave of challengers to sate the dwarves’ thirst for blood. Despite his chains, Gorosh’s savage technique keeps him undefeated- until an adventurer proves otherwise.
                        ]]
        },
        {
            bossID = 9028,
            spells = {},
            name = "Grizzle",
            story = [[
            Grizzle is an ogre enforcer enslaved by Dark Iron dwarves. Towering above even the stoutest guard, he was “invited” into the arena for his brute strength. Now he waits in the claustrophobic cells, daydreaming of raw violence. When Grizzle steps onto the arena floor, lesser foes often flee at his roar alone.
                        ]]
        },
        {
            bossID = 9029,
            spells = {},
            name = "Eviscerator",
            story = [[
            A monstrous trogg mutated by volcanic energies, the Eviscerator was once a shaman of its primitive tribe. Trapped in the Depths, it’s lost nearly all sense of self, attacking with savage ferocity. Slavering jaws and iron claws reduce foes to carrion, fueling rumors that it’s part of twisted experiments deep in the mountain.
                        ]]
        },
        {
            bossID = 9030,
            spells = {},
            name = "Ok'thor the Breaker",
            story = [[
            Ok’thor is a towering elemental champion caged in the Depths. Summoned from the Plane of Earth by runic incantations, he stands watch within the arena, smashing any forced to fight beneath his stone fists. Some say Ok’thor’s resonant voice can crumble walls, a threat even to the mountain’s ancient foundations.
                        ]]
        },
        {
            bossID = 9031,
            spells = {},
            name = "Anub'shiah",
            story = [[
            Anub’shiah is a cunning crypt fiend from the frozen wastes, somehow bargained into the Dark Irons’ service. Its chitinous limbs drip with venom, and it scuttles through volcanic corridors, weaving webs in fiery caverns. Dark rumors suggest Thaurissan’s summoners used twisted frost-fire magic to bind Anub’shiah away from its glacial domain.
                        ]]
        },
        {
            bossID = 9032,
            spells = {},
            name = "Hedrum the Creeper",
            story = [[
            Hedrum is a grotesque spider abomination, a hybrid of molten rock and living arachnid. Hatched in a hidden brood-chamber, it now infests the arena’s sub-levels. Where it crawls, lava drips from spinnerets, creating webs of molten slag. Hedrum’s venom-laced fangs and blistering silk ensure no intruder escapes unscathed.
                        ]]
        },
        {
            bossID = 9033,
            spells = {},
            name = "General Angerforge",
            story = [[
            General Angerforge commands the Dark Iron military, forging elite armies in the raging fires beneath Blackrock. A tactical genius, he employs advanced gunpowder, heavy artillery, and dwarven discipline to secure the mountain’s defenses. Clad in blackened plate, Angerforge crushes rebellions and repels invaders with ruthless efficiency.
                        ]]
        },
        {
            bossID = 9034,
            spells = {},
            name = "Hate'rel",
            story = [[
            Hate’rel is one of the Dark Iron dwarves consumed by negative emotions amplified by ancient curses. He leads a small sect devoted to spreading despair throughout the Depths. His boiling rage manifests in brutal hammer strikes and curses that stoke similar hatred within his foes, turning them against their own.
                        ]]
        },
        {
            bossID = 9035,
            spells = {},
            name = "Anger'rel",
            story = [[
            Anger’rel exemplifies the destructive fury festering in Dark Iron hearts. He channels berserker rages into unstoppable assaults, swinging a warhammer with relentless force. Where Hate’rel kindles hatred, Anger’rel fans it into a blazing inferno, reveling in the chaotic battles that erupt within the claustrophobic corridors.
                        ]]
        },
        {
            bossID = 9036,
            spells = {},
            name = "Vile'rel",
            story = [[
            Vile’rel bathes in cruelty, delighting in torment. He stands at the side of Anger’rel and Hate’rel, completing the triad of negativity. Through blighted rites, he harnesses shadowy spells that corrode body and spirit. Those who fall under his cruelty are left broken, prey for the Depths’ darker denizens.
                        ]]
        },
        {
            bossID = 9037,
            spells = {},
            name = "Gloom'rel",
            story = [[
            Gloom’rel is a Dark Iron sorcerer whose despondent spirit conjures illusions of hopelessness. He wanders the Depths, whispering doubts into the minds of allies and enemies alike. Some claim he was once a hopeful acolyte who lost everything in the War of the Three Hammers, consumed by sorrow turned malignant.
                        ]]
        },
        {
            bossID = 9038,
            spells = {},
            name = "Seeth'rel",
            story = [[
            Seeth’rel incarnates simmering resentment. Barely containing a silent fury, he weaves hexes that inflame grudges, turning friends into foes at the slightest provocation. In the shadows of Blackrock Depths, Seeth’rel cultivates paranoia, ensuring trust crumbles and the Dark Irons can exploit the ensuing chaos.
                        ]]
        },
        {
            bossID = 9039,
            spells = {},
            name = "Doom'rel",
            story = [[
            Doom’rel embraces finality- spreading prophecy of destruction throughout the Depths. He claims all dwarves are doomed to serve the fires beneath the mountain. His presence radiates inevitability, weakening foes’ resolve. Many captured adventurers have simply given up, shackled by his bleak words before even raising a blade.
                        ]]
        },
        {
            bossID = 9040,
            spells = {},
            name = "Dope'rel",
            story = [[
            Some say Dope’rel lost his wits to repeated arcane backfires. He stumbles through the Depths, uttering nonsensical riddles that might hide scraps of Titan-lore or worthless babble. Yet in combat, he unleashes wild bursts of magic with haphazard brilliance, an unpredictable threat that baffles even seasoned veterans.
                        ]]
        },
        {
            bossID = 9041,
            spells = {},
            name = "Warder Stilgiss",
            story = [[
            Warder Stilgiss oversees the deeper cell blocks, recognized by his spiked Dark Iron helm. A harsh disciplinarian, he personally checks on prisoners to ensure they remain broken. His iron whip can channel scorching embers, each lash reflecting the sadistic glee he takes in enforcing the emperor’s laws.
                        ]]
        },
        {
            bossID = 9042,
            spells = {},
            name = "Verek",
            story = [[
            Verek was once a loyal guard dog mutated by elemental experiments. Now half-wolf, half-lava beast, it prowls the prisons with unnatural cunning. Its glowing fangs sear flesh on contact. Some dwarves claim Verek recognizes no master but the molten heart of the mountain itself, patrolling with primal ferocity.
                        ]]
        },
        {
            bossID = 9056,
            spells = {},
            name = "Fineous Darkvire",
            story = [[
            Chief Architect of the Dark Irons, Fineous Darkvire oversees expansions to the city’s labyrinthine corridors. Infused with runic mastery, he shapes molten metal like clay, building formidable defenses. Known for his arrogance, Darkvire dispatches intruders with conjured golems- proud constructs of his unstoppable craftsmanship.
                        ]]
        },
        {
            bossID = 9156,
            spells = {},
            name = "Ambassador Flamelash",
            story = [[
            An envoy of Ragnaros, Flamelash negotiated an alliance between the Firelord and the Dark Irons. He relishes destruction, conjuring swirling firestorms in secret summoning chambers. Driven by fanatic loyalty to elemental fire, Flamelash punishes any perceived slight with a wrathful blaze, leaving blackened corpses in his wake.
                        ]]
        },
        {
            bossID = 9319,
            spells = {},
            name = "Houndmaster Grebmar",
            story = [[
            Houndmaster Grebmar trains infernal core hounds in hidden kennels. Grizzled from burns and bites, he’s earned the beasts’ respect through brutal discipline. Leading them on short iron leashes, he unleashes them at the first sign of trouble, letting them feast on unsuspecting travelers wandering too far into the Depths.
                        ]]
        },
        {
            bossID = 9499,
            spells = {},
            name = "Plugger Spazzring",
            story = [[
            Plugger Spazzring runs the Blackrock Depths’ notorious tavern within the Grim Guzzler. A sly and opportunistic goblin, he’s turned the bar into a hub for smugglers, cutthroats, and unsuspecting explorers. Quick with a grin- and quicker to cheat- he deals in stolen brews and explosive moonshine, always turning a profit.
                        ]]
        },
        {
            bossID = 9502,
            spells = {},
            name = "Phalanx",
            story = [[
            Phalanx is an experimental golem that serves as bouncer for the Grim Guzzler. Fueled by archaic kegs of potent brew, it follows simple directives: throw out troublemakers by any means necessary. Adventurers who make the wrong enemies in the tavern soon find themselves hammered- sometimes literally- by Phalanx’s metallic fists.
                        ]]
        },
        {
            bossID = 9537,
            spells = {},
            name = "Hurley Blackbreath",
            story = [[
            A dwarven pirate turned smuggler, Hurley Blackbreath washes down every heist with strong ale. Rumor says he once hijacked a barge to sail molten rivers. Now he lingers in the Grim Guzzler, starting brawls or selling contraband. Woe to anyone who tries to cut into his profits or hamper his rowdy fun.
                        ]]
        },
        {
            bossID = 9543,
            spells = {},
            name = "Ribbly Screwspigot",
            story = [[
            Ribbly Screwspigot is a gnome con artist who built his fortune trading questionable “inventions.” After crossing the wrong customers, he fled to the Grim Guzzler for protection. Surrounded by shady patrons, Ribbly peddles his contraptions, from explosive brew taps to misguided mechanical pets, often with disastrous results.
                        ]]
        },
        {
            bossID = 9938,
            spells = {},
            name = "Magmus",
            story = [[
            Magmus is a colossal fire elemental patrolling the final approach to Thaurissan’s throne. Harnessing the mountain’s fiery core, it channels pillars of scorching flame. Only the boldest adventurers would dare face Magmus’s infernal might, for beyond it lies the emperor himself- and the fate of Blackrock Depths.
                        ]]
        },
    },
    versions = mp_versions,
    specialItems = { 11630, 11813, 11207, 11612, 18653, 12033 },
    specialDrop = { [[Lord Roccor]], [[Lord Roccor]], [[Pyromancer Loregrain]], [[Ribbly Screwspigot]], [[Hurley Blackbreath]], [[Princess Moira Bronzebeard]] },
    items = { 261001, 261501, 309501, 647501, 281501, 282001, 282501, 283001, 257501, 259501, 260001, 260501, 888501, 889001, 889501, 891501, 258001, 258501, 259001, 648001, 270001, 650501, 651001, 653501, 268501, 269001, 269501, 653001, 266501, 267501, 268001, 271501, 263501, 264001, 270501, 290001, 265001, 265501, 266001, 272001, 262001, 262501, 263001, 271001, 275001, 275501, 276001, 276501, 284501, 286501, 287001, 288001, 288501, 264501, 287501, 289001, 289501, 305001, 306501, 308001, 311001, 272501, 513001, 513501, 654001, 305501, 307001, 322501, 323001, 273001, 273501, 274001, 645001, 277501, 278001, 278501, 279001, 279501, 291001, 291501, 292001, 306001, 645501, 280001, 280501, 281001, 307501, 648501, 277001, 649001, 283501, 284001, 285001, 285501, 290501, 274501, 300001, 308501, 644501, 309001, 310001, 310501, 311501, 312001, 267001, 286001, 294501, 296501, 297501, 298001, 298501, 299001, 299501, 643501, 644001 },
    droplocation = { [[Lord Roccor]], [[Lord Roccor]], [[Lord Roccor]], [[Lord Roccor]], [[Bael'Gar]], [[Bael'Gar]], [[Bael'Gar]], [[Bael'Gar]], [[Houndmaster Grebmar]], [[Houndmaster Grebmar]], [[Houndmaster Grebmar]], [[Houndmaster Grebmar]], [[Panzor the Invincible]], [[Panzor the Invincible]], [[Panzor the Invincible]], [[Panzor the Invincible]], [[High Interrogator Gerstahn]], [[High Interrogator Gerstahn]], [[High Interrogator Gerstahn]], [[High Interrogator Gerstahn]], [[Gorosh the Dervish]], [[Gorosh the Dervish]], [[Gorosh the Dervish]], [[Gorosh the Dervish]], [[Grizzle]], [[Grizzle]], [[Grizzle]], [[Grizzle]], [[Eviscerator]], [[Eviscerator]], [[Eviscerator]], [[Eviscerator]], [[Ok'thor the Breaker]], [[Ok'thor the Breaker]], [[Ok'thor the Breaker]], [[Ok'thor the Breaker]], [[Anub'shiah]], [[Anub'shiah]], [[Anub'shiah]], [[Anub'shiah]], [[Hedrum the Creeper]], [[Hedrum the Creeper]], [[Hedrum the Creeper]], [[Hedrum the Creeper]], [[Pyromancer Loregrain]], [[Pyromancer Loregrain]], [[Pyromancer Loregrain]], [[Pyromancer Loregrain]], [[General Angerforge]], [[General Angerforge]], [[General Angerforge]], [[General Angerforge]], [[General Angerforge]], [[Golem Lord Argelmach]], [[Golem Lord Argelmach]], [[Golem Lord Argelmach]], [[Golem Lord Argelmach]], [[Ribbly Screwspigot]], [[Ribbly Screwspigot]], [[Ribbly Screwspigot]], [[Ribbly Screwspigot]], [[Ribbly Screwspigot]], [[Hurley Blackbreath]], [[Hurley Blackbreath]], [[Hurley Blackbreath]], [[Plugger Spazzring]], [[Plugger Spazzring]], [[Plugger Spazzring]], [[Plugger Spazzring]], [[Plugger Spazzring]], [[Phalanx]], [[Phalanx]], [[Phalanx]], [[Phalanx]], [[Lord Incendius]], [[Lord Incendius]], [[Lord Incendius]], [[Lord Incendius]], [[Lord Incendius]], [[Fineous Darkvire]], [[Fineous Darkvire]], [[Fineous Darkvire]], [[Fineous Darkvire]], [[Fineous Darkvire]], [[Warder Stilgiss]], [[Warder Stilgiss]], [[Warder Stilgiss]], [[Warder Stilgiss]], [[Warder Stilgiss]], [[Verek]], [[Verek]], [[Ambassador Flamelash]], [[Ambassador Flamelash]], [[Ambassador Flamelash]], [[Ambassador Flamelash]], [[Ambassador Flamelash]], [[Magmus]], [[Magmus]], [[Magmus]], [[Magmus]], [[Princess Moira Bronzebeard]], [[Princess Moira Bronzebeard]], [[Princess Moira Bronzebeard]], [[Princess Moira Bronzebeard]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]], [[Emperor Dagran Thaurissan]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Blackrock Spire",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackrockSpire.blp",
    bosses = {
        {
            bossID = 9196,
            spells = {},
            name = "Highlord Omokk",
            story = [[
            Highlord Omokk commands the ogre armies entrenched within Blackrock Spire. Under his iron fist, disorganized brutes rally into a savage warband. Omokk’s colossal strength is matched only by his towering ego, and he eagerly crushes intruders- often literally- to prove that the ogres remain dominant in the Spire’s brutal hierarchy.
                        ]]
        },
        {
            bossID = 9217,
            spells = {},
            name = "Spirestone Lord Magus",
            story = [[
            Among the arcane-savvy ogres, Lord Magus stands out as both cunning and cruel. Twisting fel energies, he manipulates lesser ogres to obey his every whim. The corridors of Lower Blackrock Spire bear the scorched marks of his destructive spells, a testament to his relentless quest for mystical power.
                        ]]
        },
        {
            bossID = 9218,
            spells = {},
            name = "Spirestone Battle Lord",
            story = [[
            The Spirestone Battle Lord leads elite ogre guards tasked with defending critical choke points. Driven by unyielding discipline- a rarity among ogres- he trains his cohorts relentlessly, forging them into a ferocious blockade. Adventurers who test their might against these hardened soldiers often meet swift, brutal defeat.
                        ]]
        },
        {
            bossID = 9219,
            spells = {},
            name = "Spirestone Butcher",
            story = [[
            This hulking ogre earned his name by carving up intruders (and dissenters) with horrifying gusto. He turned entire corridors into abattoirs, hanging trophies of bone and flesh to warn others of his domain. Encountering him is less a battle and more a desperate fight for survival against unstoppable bloodlust.
                        ]]
        },
        {
            bossID = 9236,
            spells = {},
            name = "Shadow Hunter Vosh'gajin",
            story = [[
            A troll shadow hunter who pledged her dark arts to the ogres, Vosh’gajin weaves voodoo curses amid the labyrinthine halls. Her totems drain life from enemies, feeding her own twisted powers. Some say she hunts lost adventurers for trollish rites, offering their spirits to malevolent Loa dwelling in the depths.
                        ]]
        },
        {
            bossID = 9237,
            spells = {},
            name = "War Master Voone",
            story = [[
            War Master Voone once led raiding parties across Redridge and Burning Steppes. Now he organizes the Spire’s constant strikes, forging alliances with black dragons and trolls to expand the domain. His war banners line the stone walls, each symbolizing a conquest that brought him closer to overshadowing the orcs’ authority.
                        ]]
        },
        {
            bossID = 9568,
            spells = {},
            name = "Overlord Wyrmthalak",
            story = [[
            Overlord Wyrmthalak is a cunning orc general charged by Rend Blackhand to oversee the lower spire. A master strategist, he sows disarray by pitting trolls, ogres, and black dragons against any threat. His presence cements the uneasy alliance among the spire’s factions- if only through fear of his iron discipline.
                        ]]
        },
        {
            bossID = 9596,
            spells = {},
            name = "Bannok Grimaxe",
            story = [[
            A legendary orc mercenary, Bannok Grimaxe roams the corridors in search of worthy foes. Stories tell of him single-handedly felling entire warbands. Once a champion under the Blackrock banner, he now tests the resolve of anyone who dares approach. Those who defeat him earn reluctant respect- if they survive.
                        ]]
        },
        {
            bossID = 9718,
            spells = {},
            name = "Ghok Bashguud",
            story = [[
            Ghok Bashguud is a brutal ogre champion known for decimating smaller clans and absorbing them into the Blackrock fold. He wields a spiked club rumored to be fashioned from a fel-corrupted tree trunk. Ghok fights with savage glee, confident in his strength to flatten anyone too weak to stand beside him.
                        ]]
        },
        {
            bossID = 9736,
            spells = {},
            name = "Quartermaster Zigris",
            story = [[
            Quartermaster Zigris ensures the spire’s war machine stays supplied with rations, weaponry, and contraband. He’s made shady deals with goblins and orcs alike, filling his storerooms with stolen goods. Underestimate him at your peril- he’s fiercely protective of his cargo, using hidden traps and crossbows to keep thieves at bay.
                        ]]
        },
        {
            bossID = 9816,
            spells = {},
            name = "Pyroguard Emberseer",
            story = [[
            A living conflagration bound by arcane seals, Emberseer stands watch over a sacred forge. Brought here by the black dragons to amplify the spire’s power, he immolates any who approach. His flames feed on the grudges and hatred saturating Blackrock, intensifying into a scorching inferno capable of melting steel.
                        ]]
        },
        {
            bossID = 10220,
            spells = {},
            name = "Halycon",
            story = [[
            Halycon is a massive worg matriarch prowling the spire’s ramparts. Her pack claims entire corridors, fiercely defending them from intruders. The worgs’ howls echo off the stone walls, sending a chill through even battle-hardened adventurers. Some suspect a deeper intelligence guides her, forging strategies humans would never expect.
                        ]]
        },
        {
            bossID = 10263,
            spells = {},
            name = "Burning Felguard",
            story = [[
            Summoned from the darkest corners of the Twisting Nether, this felguard embodies the black dragons’ alliance with demonic forces. Surrounded by searing green flames, it enforces the spire’s demonic pacts. The very air crackles with brimstone around it, scorching illusions of power into the minds of would-be warlocks.
                        ]]
        },
        {
            bossID = 10264,
            spells = {},
            name = "Solakar Flamewreath",
            story = [[
            A draconic servitor of the black flight, Solakar Flamewreath roosts in the spire’s upper reaches. Coiling flames dance along his wings, scorching intruders from above. Each roar resonates with draconic fury, a testament to Nefarian’s hold on the fortress. Defeating Solakar means silencing one of Nefarian’s loyal enforcers.
                        ]]
        },
        {
            bossID = 10268,
            spells = {},
            name = "Gizrul the Slavener",
            story = [[
            Gizrul, broodmate to Halycon, is a massive worg enslaved by orc beastmasters and forcibly corrupted with dark magic. He prowls the lower halls, thick shackles clanking as he hunts trespassers. Though subdued, the wild fury in his eyes suggests he might one day break free, turning on allies and foes alike.
                        ]]
        },
        {
            bossID = 10339,
            spells = {},
            name = "Gyth",
            story = [[
            The fearsome brood of Nefarian, Gyth is a black drake bound to serve Rend Blackhand. Armed with razor-sharp talons and acidic breath, Gyth scours the ramparts for prey. The synergy between Gyth and Rend is lethal- together they aim to claim the spire in the name of their black dragon overlords.
                        ]]
        },
        {
            bossID = 10363,
            spells = {},
            name = "General Drakkisath",
            story = [[
            General Drakkisath is the ultimate authority within Upper Blackrock Spire, second only to Nefarian himself. Towering in blackplate armor, he commands black dragonspawn, orcs, trolls, and ogres in a carefully maintained power balance. Enemies who reach his inner sanctum discover a tactician whose fiery wrath can devastate entire armies.
                        ]]
        },
        {
            bossID = 10376,
            spells = {},
            name = "Crystal Fang",
            story = [[
            A colossal spider mutated by arcane energies, Crystal Fang lurks in crystalline caverns. Its translucent carapace refracts torchlight into dazzling patterns- an eerie sight before it strikes. Those who wander from the main corridors risk entombment in its shimmering webs, left to rot amid the spider’s silent, crystalline domain.
                        ]]
        },
        {
            bossID = 10429,
            spells = {},
            name = "Warchief Rend Blackhand",
            story = [[
            Rend Blackhand, son of the legendary Blackhand, seeks to restore the orcs’ supremacy. Leading the “True Horde” within the Spire, he formed alliances with black dragons, forging a heavily-armed legion. Cunning and merciless, Rend aims to dethrone Thrall and reshape the Horde in his own brutal image.
                        ]]
        },
        {
            bossID = 10430,
            spells = {},
            name = "The Beast",
            story = [[
            Known simply as “The Beast,” this towering core hound prowls the upper tiers of the spire. Rumored to be a gift from Ragnaros, it devours foes in an inferno of fang and flame. Adventurers who disturb its lair rarely survive, their screams echoing through blackened corridors.
                        ]]
        },
        {
            bossID = 10509,
            spells = {},
            name = "Jed Runewatcher",
            story = [[
            Jed Runewatcher is an orc shaman who turned to arcane runes instead of elemental spirits. Banished from the Earthen Ring, he found sanctuary in Blackrock Spire, perfecting his dark runic arts. Now, he infuses allies with eldritch power, twisting shamanic tradition into a weapon that threatens to remake orcish magic.
                        ]]
        },
        {
            bossID = 10584,
            spells = {},
            name = "Urok Doomhowl",
            story = [[
            A savage warchief exiled by Rend for attempting to seize power, Urok roams the hidden warrens of Lower Blackrock Spire. In a desperate bid to reclaim glory, he’s formed his own warband of outcasts. Whenever new challengers arrive, Urok sees a chance to prove his might- and possibly dethrone Rend at last.
                        ]]
        },
        {
            bossID = 10596,
            spells = {},
            name = "Mother Smolderweb",
            story = [[
            Vast and ancient, Mother Smolderweb resides in webs that span entire caverns. Her brood of venomous offspring scuttles through cracks, defending their matriarch from intruders. Trolls and orcs alike whisper that her potent venom can melt steel, leading some to risk the webs for the promise of forging mightier arms.
                        ]]
        },
        {
            bossID = 10899,
            spells = {},
            name = "Goraluk Anvilcrack",
            story = [[
            Master smith Goraluk Anvilcrack shapes wargear for the spire’s legion. He harnesses dragonfire and fel heat to forge weapons rumored to slice through plate like parchment. Each masterpiece fuels Blackrock’s war machine. Rumor claims Goraluk’s final project- a blade of living shadow- could tilt the balance of power in the spire’s favor.
                        ]]
        },
    },
    versions = mp_versions,
    specialItems = { 12662, 18784, 12835, 21955, 18779, 12728, 12834, 12837, 12871, 13522, 13519, 15730, 12654 },
    specialDrop = { [[Burning Felguard]], [[Urok Doomhowl]], [[Quartermaster Zigris]], [[Quartermaster Zigris]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Gyth]], [[Gyth]], [[General Drakkisath]], [[General Drakkisath]], [[Shadow Hunter Vosh'gajin]] },
    items = { 340501, 341001, 341501, 342001, 342501, 319501, 321001, 321501, 352001, 352501, 1109501, 1113501, 1112501, 1113001, 1112001, 1111501, 1111001, 312501, 343001, 344001, 646501, 664501, 890001, 890501, 891001, 344501, 349001, 350001, 516001, 326501, 345001, 345501, 349501, 1110001, 1110501, 343501, 353001, 353501, 647001, 351001, 351501, 517001, 649501, 331501, 346001, 346501, 347001, 347501, 348001, 348501, 654501, 337001, 338001, 338501, 339001, 339501, 340001, 323501, 324001, 324501, 325001, 314501, 316501, 318001, 318501, 317001, 317501, 325501, 331001, 377001, 377501, 514001, 514501, 313001, 313501, 314001, 315001, 327001, 327501, 319001, 320001, 320501, 329501, 516501, 326001, 328001, 328501, 329001, 646001, 322001, 330001, 330501, 332001, 332501, 315501, 316001, 334501, 336001, 336501, 650001, 651501, 652001, 652501 },
    droplocation = { [[Highlord Omokk]], [[Highlord Omokk]], [[Highlord Omokk]], [[Highlord Omokk]], [[Highlord Omokk]], [[Shadow Hunter Vosh'gajin]], [[Shadow Hunter Vosh'gajin]], [[Shadow Hunter Vosh'gajin]], [[Shadow Hunter Vosh'gajin]], [[Shadow Hunter Vosh'gajin]], [[Spirestone Butcher]], [[Spirestone Butcher]], [[Spirestone Battle Lord]], [[Spirestone Battle Lord]], [[Spirestone Lord Magus]], [[Spirestone Lord Magus]], [[Spirestone Lord Magus]], [[War Master Voone]], [[War Master Voone]], [[War Master Voone]], [[War Master Voone]], [[War Master Voone]], [[Ghok Bashguud]], [[Ghok Bashguud]], [[Ghok Bashguud]], [[Mother Smolderweb]], [[Mother Smolderweb]], [[Mother Smolderweb]], [[Mother Smolderweb]], [[Crystal Fang]], [[Crystal Fang]], [[Crystal Fang]], [[Crystal Fang]], [[Burning Felguard]], [[Burning Felguard]], [[Urok Doomhowl]], [[Urok Doomhowl]], [[Urok Doomhowl]], [[Urok Doomhowl]], [[Quartermaster Zigris]], [[Quartermaster Zigris]], [[Quartermaster Zigris]], [[Gizrul the Slavener]], [[Gizrul the Slavener]], [[Gizrul the Slavener]], [[Gizrul the Slavener]], [[Gizrul the Slavener]], [[Halycon]], [[Halycon]], [[Halycon]], [[Halycon]], [[Overlord Wyrmthalak]], [[Overlord Wyrmthalak]], [[Overlord Wyrmthalak]], [[Overlord Wyrmthalak]], [[Overlord Wyrmthalak]], [[Overlord Wyrmthalak]], [[Pyroguard Emberseer]], [[Pyroguard Emberseer]], [[Pyroguard Emberseer]], [[Pyroguard Emberseer]], [[Solakar Flamewreath]], [[Solakar Flamewreath]], [[Solakar Flamewreath]], [[Solakar Flamewreath]], [[Jed Runewatcher]], [[Jed Runewatcher]], [[Jed Runewatcher]], [[Jed Runewatcher]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Goraluk Anvilcrack]], [[Warchief Rend Blackhand]], [[Warchief Rend Blackhand]], [[Warchief Rend Blackhand]], [[Warchief Rend Blackhand]], [[Warchief Rend Blackhand]], [[Warchief Rend Blackhand]], [[Bannok Grimaxe]], [[Bannok Grimaxe]], [[Bannok Grimaxe]], [[Bannok Grimaxe]], [[Bannok Grimaxe]], [[Gyth]], [[Gyth]], [[Gyth]], [[Gyth]], [[Gyth]], [[The Beast]], [[The Beast]], [[The Beast]], [[The Beast]], [[The Beast]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]], [[General Drakkisath]] }
})
table.insert(_G.Valanior.djDungeons, {
    name = "Scholomance",
    description =
    [[Lorem Ipsum is simply dummy text of the debugPrinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown debugPrinter took a galley of type and scrambled it to make a type specimen book. ]],
    icon = "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Scholomance.blp",
    bosses = {
        {
            bossID = 1853,
            spells = {},
            name = "Darkmaster Gandling",
            story = [[
            Headmaster of Scholomance, Darkmaster Gandling presides over necromantic experiments with sadistic pride. Students are indoctrinated to harness death magic, fueling the Scourge’s armies. Gandling’s cunning spells and relentless minions reflect his mastery of necromancy, making him the final test in these cursed halls.
                        ]]
        },
        {
            bossID = 10432,
            spells = {},
            name = "Vectus",
            story = [[
            Vectus, an acolyte of Kel’Thuzad, specialized in virulent plagues. In the hidden labs of Scholomance, he perfected necrotic toxins that gnaw at body and spirit. Even undeath hasn’t dulled his twisted intellect- he yearns to spread pestilence across Azeroth in the Lich King’s name.
                        ]]
        },
        {
            bossID = 10433,
            spells = {},
            name = "Marduk Blackpool",
            story = [[
            A once-proud warrior turned death knight, Marduk Blackpool trudges Scholomance’s corridors, clad in rusted plate. He was lured by promises of eternal glory. Instead, he found only a corrupted blade and a festering spirit. Now his spectral presence projects waves of despair that drain the will of any who oppose him.
                        ]]
        },
        {
            bossID = 10502,
            spells = {},
            name = "Lady Illucia Barov",
            story = [[
            Heir to the Barov fortune, Illucia was once a socialite obsessed with wealth and power. When the Scourge claimed her estate, she eagerly joined Kel’Thuzad’s inner circle, sacrificing her soul for dark sorceries. In undeath, her refined veneer masks a ruthless hunger for dominion over the living and the dead.
                        ]]
        },
        {
            bossID = 10503,
            spells = {},
            name = "Jandice Barov",
            story = [[
            Jandice Barov, master of illusions, uses apparitions to torment trespassers. She was the Barov family’s cunning daughter, forging a pact with the Scourge to preserve her lavish lifestyle. Her illusions tear at a foe’s sanity, forcing them to battle phantasms while she cackles from the shadows.
                        ]]
        },
        {
            bossID = 10504,
            spells = {},
            name = "Lord Alexei Barov",
            story = [[
            Lord Alexei Barov was patriarch of the Barov line, once presiding over vast lands. Offered everlasting power by Kel’Thuzad, he joined the necromantic academy within Scholomance. Now undead nobility, Alexei roams dusty corridors, enforcing the Barov legacy with unholy vigor and a profound contempt for mortal weakness.
                        ]]
        },
        {
            bossID = 10505,
            spells = {},
            name = "Instructor Malicia",
            story = [[
            Malicia heads the grim curriculum of Scholomance, drilling students in the darkest necromantic arts. Surrounded by wailing spirits of failed apprentices, she’s known for vicious lessons that leave most novices insane- or dead. She believes pain is the best teacher, a philosophy that shapes each vile ritual she oversees.
                        ]]
        },
        {
            bossID = 10506,
            spells = {},
            name = "Kirtonos the Herald",
            story = [[
            Kirtonos was once a noble scholar whose obsession with immortality led him to Scholomance. Tricked into vampiric servitude, he haunts the rooftops, swooping down to feast on fresh blood. Summoned by a bloody brazier ritual, Kirtonos cackles as he announces the coming apocalypse orchestrated within these halls.
                        ]]
        },
        {
            bossID = 10507,
            spells = {},
            name = "The Ravenian",
            story = [[
            Spawned from forbidden experiments merging worgen and ghoul, The Ravenian is a monstrous creation. Its bestial rage is harnessed through necromancy, turning it into a powerful enforcer. It stands guard over deeper chambers, hungering for flesh and ripping apart anyone it perceives as a threat to Scholomance’s secrets.
                        ]]
        },
        {
            bossID = 10508,
            spells = {},
            name = "Ras Frostwhisper",
            story = [[
            Ras Frostwhisper was once a Kirin Tor mage who delved into taboo ice magic. Embracing necromancy, he became a lich, trading life for arcane might. Residing in frozen laboratories, Ras refines spells that freeze flesh and sap souls. Icicles formed from the tears of tormented spirits adorn his frosty domain.
                        ]]
        },
        {
            bossID = 10901,
            spells = {},
            name = "Lorekeeper Polkelt",
            story = [[
            Polkelt served as historian to the Barovs, meticulously recording their lineage. After the family’s fall to the Scourge, he became Scholomance’s archivist, scribing twisted tomes. Undeath sharpened his obsession, fueling experiments to bind knowledge to souls. The library groans under the weight of cursed scrolls concealing hidden horrors.
                        ]]
        },
        {
            bossID = 11261,
            spells = {},
            name = "Doctor Theolen Krastinov",
            story = [[
            “Doctor” Krastinov is Scholomance’s most infamous butcher. Known as “the Butcher,” he dissects living subjects to refine necromantic procedures. His operating theater reeks of gore and formaldehyde. Operating scalpels glow with dark energies. Some undead even fear him, recognizing that his thirst for sadistic experimentation knows no bounds.
                        ]]
        },
        {
            bossID = 11622,
            spells = {},
            name = "Rattlegore",
            story = [[
            Rattlegore is a colossal skeletal construct pieced together from the remains of countless victims. Raised to guard Scholomance’s main laboratory, it crushes intruders beneath bony limbs. Alchemical reagents and necrotic runes reinforce its frame, making Rattlegore a nearly unstoppable engine of death bound to the academy’s sinister purpose.
                        ]]
        },
    },
    versions = mp_versions,
    specialItems = { 13523, 18782, 13521, 13501, 14514 },
    specialDrop = { [[Jandice Barov/Doctor Theolen Krastinov]], [[Rattlegore]], [[Ras Frostwhisper]], [[Darkmaster Gandling]], [[Darkmaster Gandling]], },
    items = { 385001, 386001, 387001, 387501, 388001, 388501, 398501, 399001, 399501, 574501, 575001, 655501, 395001, 395501, 396501, 397001, 397501, 574001, 384501, 385501, 393001, 398001, 400001, 576001, 383001, 394501, 400501, 575501, 576501, 577001, 354001, 392001, 392501, 393501, 394001, 578001, 396001, 403501, 406501, 409501, 573001, 580501, 401001, 404001, 407001, 410001, 573501, 581001, 372001, 401501, 404501, 407501, 410501, 578501, 382501, 402001, 405001, 408001, 571501, 579001, 402501, 405501, 408501, 572001, 577501, 579501, 381001, 403001, 406001, 409001, 572501, 580001, 380501, 381501, 382001, 383501, 386501, 662501 },
    droplocation = { [[Kirtonos the Herald]], [[Kirtonos the Herald]], [[Kirtonos the Herald]], [[Kirtonos the Herald]], [[Kirtonos the Herald]], [[Kirtonos the Herald]], [[Jandice Barov]], [[Jandice Barov]], [[Jandice Barov]], [[Jandice Barov]], [[Jandice Barov]], [[Jandice Barov]], [[Rattlegore]], [[Rattlegore]], [[Rattlegore]], [[Rattlegore]], [[Rattlegore]], [[Rattlegore]], [[Marduk Blackpool]], [[Marduk Blackpool]], [[Marduk Blackpool]], [[Marduk Blackpool]], [[Marduk Blackpool]], [[Marduk Blackpool]], [[Vectus]], [[Vectus]], [[Vectus]], [[Vectus]], [[Vectus]], [[Vectus]], [[Ras Frostwhisper]], [[Ras Frostwhisper]], [[Ras Frostwhisper]], [[Ras Frostwhisper]], [[Ras Frostwhisper]], [[Ras Frostwhisper]], [[Instructor Malicia]], [[Instructor Malicia]], [[Instructor Malicia]], [[Instructor Malicia]], [[Instructor Malicia]], [[Instructor Malicia]], [[Doctor Theolen Krastinov]], [[Doctor Theolen Krastinov]], [[Doctor Theolen Krastinov]], [[Doctor Theolen Krastinov]], [[Doctor Theolen Krastinov]], [[Doctor Theolen Krastinov]], [[Lorekeeper Polkelt]], [[Lorekeeper Polkelt]], [[Lorekeeper Polkelt]], [[Lorekeeper Polkelt]], [[Lorekeeper Polkelt]], [[Lorekeeper Polkelt]], [[The Ravenian]], [[The Ravenian]], [[The Ravenian]], [[The Ravenian]], [[The Ravenian]], [[The Ravenian]], [[Lord Alexei Barov]], [[Lord Alexei Barov]], [[Lord Alexei Barov]], [[Lord Alexei Barov]], [[Lord Alexei Barov]], [[Lord Alexei Barov]], [[Lady Illucia Barov]], [[Lady Illucia Barov]], [[Lady Illucia Barov]], [[Lady Illucia Barov]], [[Lady Illucia Barov]], [[Lady Illucia Barov]], [[Darkmaster Gandling]], [[Darkmaster Gandling]], [[Darkmaster Gandling]], [[Darkmaster Gandling]], [[Darkmaster Gandling]], [[Darkmaster Gandling]] }
})
