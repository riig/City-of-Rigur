using common.resources;
using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        private _ Customs = () => Behav()
            .Init("Chad the Beach Bum",
                new State(
                    new Prioritize(
                        new StayCloseToSpawn(0.30, range: 1),
                        new Wander(0.30)
                        ),
                    new State("taunt",
                        new Taunt("I need like, a Stack of Wood, or something, to start more campfires, duuude!",
                                "You guys have weapons, it's only fair you go get me a Stack of Wood. I have gold to pay.",
                                "I pay gold for Stacks of Wood, please help me, I need to build shelter on the beach!"
                                ),
                        new TimedTransition(5000, "no_taunt")
                        ),
                    new State("no_taunt",
                        new TimedTransition(5000, "taunt")
                        )
                    )
            )
                    .Init("Paul the Merchant",
                new State(
                    new Prioritize(
                        new StayCloseToSpawn(0.30, range: 1),
                        new Wander(0.30)
                        ),
                    new State("taunt",
                        new Taunt("I am offering gold to those who have the highest of the tiers!",
                                "Buying all top tiered equipment, I have shiny gold!",
                                "I pay same price for special tiers."
                                ),
                        new TimedTransition(7000, "no_taunt")
                        ),
                    new State("no_taunt",
                        new TimedTransition(7000, "taunt")
                        )
                    )
            )
                    .Init("Bones the Butcher",
                new State(
                    new Prioritize(
                        new StayCloseToSpawn(0.30, range: 1),
                        new Wander(0.30)
                        ),
                    new State("taunt",
                        new Taunt("I am interested in some monster meat, think you have what it takes to provide?",
                                "Willing to pay gold for some delicious meat from the monsters of the godlands.",
                                "If you bring me monster meat, I will reward you with gold coins!"
                                ),
                        new TimedTransition(9000, "no_taunt")
                        ),
                    new State("no_taunt",
                        new TimedTransition(9000, "taunt")
                        )
                    )
            )
            .Init("Horrific Creation",
                new State(
                    new State("Start",
                        new Prioritize(
                            new StayCloseToSpawn(0.3, range: 3),
                            new Wander(0.3)
                            ),
                        new PlayerWithinTransition(1, "Wait1")
                        ),
                    new State("Wait1",
                        new StayCloseToSpawn(0.3, range: 3),
                        new Wander(1),
                        new Taunt("i will eat you {PLAYER}"),
                        new TimedTransition(3000, "Flash1")
                        ),
                    new State("Flash1",
                        new StayCloseToSpawn(0.3, range: 3),
                        new Wander(1),
                        new Taunt("i am monsta"),
                        new Flash(0xffffff, 10, 50),
                        new ChangeSize(-2, 200),
                        new TimedTransition(2000, "Flash2")
                        ),
                    new State("Flash2",
                        new StayCloseToSpawn(0.3, range: 3),
                        new Wander(1),
                        new Taunt("ya heard"),
                        new Flash(0xffffff, 10, 50),
                        new ChangeSize(-2, 300),
                        new TimedTransition(2000, "Flash3")
                        ),
                   new State("Flash3",
                        new StayCloseToSpawn(0.3, range: 3),
                        new Wander(1),
                        new Taunt("am monsta"),
                        new Flash(0xffffff, 10, 50),
                        new ChangeSize(-2, 400),
                        new TimedTransition(2000, "Flash4")
                        ),
                   new State("Flash4",
                        new StayCloseToSpawn(0.3, range: 3),
                        new Wander(1),
                        new Taunt("git over here b  U  d  D  y"),
                        new Flash(0xffffff, 10, 50),
                        new ChangeSize(-2, 700),
                        new TimedTransition(10000, "Finish")
                        ),
                    new State("Finish",
                        new DropPortalOnDeath("Monster's Land Portal", 1),
                        new Suicide() //drop portal for players who are late and didnt get the "monster eating and tr
                        )
                    )
            );
    }
}