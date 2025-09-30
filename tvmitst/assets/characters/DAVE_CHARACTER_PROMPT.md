# Dave Character Sprite - AI Art Generation Prompt

## Primary DALL-E 3 Prompt for Dave

**Style Match:** Hand-drawn 2D point-and-click adventure game character sprite matching the established basement background art style - Steve Purcell's Monkey Island aesthetic mixed with Sierra's Freddy Pharkas, with expressive character design inspired by Paco Pomet's figurative work and Alexandre Diop's vibrant palette.

**Character Description:**
Dave Thompson, 34-year-old white guy experiencing a spectacular life unraveling. Former obsessive organizer whose perfectly planned life has beautifully fallen apart. Currently living in basement, disheveled but oddly endearing.

**Visual Appearance:**

- Average build, slightly slouched posture (defeated but not broken)
- Messy brown hair, needs a haircut - sticking up in chaotic directions
- 5 o'clock shadow, tired eyes but hint of confused hope in expression
- Wearing rumpled business casual: wrinkled button-down shirt (untucked), khaki pants, one sock visible (mismatched)
- Carries divorce papers stuffed in back pocket (corner visible)
- Wedding ring tan line visible on hand
- Expression: bewildered, overwhelmed, but curious - not quite broken

**Color Palette (Match Background):**

- Shirt: Dusty blue or faded teal (coordinates with basement tones)
- Pants: Khaki/tan earth tones
- Hair: Medium brown with warm highlights
- Skin: Natural caucasian tone with warm peachy undertones
- Overall: Slightly desaturated to match basement melancholy

**Character Size & Format:**

- Full body character sprite, standing idle pose
- Facing 3/4 view to the right (classic adventure game angle)
- Height approximately 100-120 pixels when scaled to game
- Clean edges for easy cutout/transparency
- Painterly style matching background, NOT pixel art

**Emotional State:**

- Face shows: confusion + exhaustion + tiny spark of hope
- Body language: slightly hunched, hands in pockets or one hand scratching head
- Overall vibe: "I used to have my life together, now I live in a basement and Spanish words are everywhere"

**Technical Specs:**

- White or transparent background for easy cutout
- Clean silhouette, readable at small sizes
- Expressive face visible even when scaled down
- Consistent art style with basement background
- Single pose: idle/standing (we can animate later)

---

## Full DALL-E 3 Prompt (Copy This!)

```
Character sprite for 2D point-and-click adventure game, style of Steve Purcell's Monkey Island and Sierra's Freddy Pharkas, painterly hand-drawn digital illustration.

Full body character, 34-year-old casual guy, standing idle pose, 3/4 view facing right. Messy brown hair sticking up, light stubble beard, tired but friendly eyes with curious expression. Wearing slightly wrinkled untucked dusty blue button-down shirt, casual khaki pants, comfortable posture with hands in pockets.

Warm earth tone color palette - dusty blue shirt, tan khaki pants, brown hair, peachy skin tones. Painterly digital art style, expressive brushwork, approachable personality. Clean silhouette readable at small size. White or transparent background for easy cutout. Adventure game character sprite, full body standing.
```

---

## ALTERNATIVE: Super Clean Prompt (If Above Still Fails)

```
Point-and-click adventure game character sprite, Monkey Island art style, painterly digital illustration. Adult male character, messy brown hair, casual wrinkled blue shirt untucked, khaki pants, friendly tired expression, hands in pockets, standing 3/4 view to the right. Warm earth tones, white background, full body sprite.
```

---

## Alternative Prompt (Multiple Poses - Optional)

If you want multiple angles in one image:

```
Character sprite sheet for 2D point-and-click adventure game, Dave Thompson, 34-year-old disheveled guy. Three views: facing left 3/4, facing right 3/4, and facing forward. Same character each time.

Messy brown hair, 5 o'clock shadow, tired but hopeful eyes. Rumpled dusty blue untucked shirt, wrinkled khaki pants. Slouched posture, hands in pockets. Divorce papers in back pocket visible.

Style: Steve Purcell Monkey Island + Freddy Pharkas, painterly hand-drawn, warm earth tones matching ochre basement aesthetic. White background, clean edges. Adventure game character sprite sheet.
```

---

## Character Personality Notes (For Reference)

From your story documents:

**Dave's Core Identity:**

- Former organization enthusiast who scheduled bathroom breaks
- Recently divorced, "restructured" from job, car "liberated", temporarily displaced
- Currently: Has nothing left to optimize, accidentally open to life's chaos
- Lovable quirks: spreadsheet obsession, attempts to feng shui basement
- Arc: From rigid control freak → learning to dance with beautiful chaos

**Visual Personality Tells:**

- Clothes show failed attempts at organization (color-coded but mismatched)
- One sleeve might be rolled up differently than the other
- Pocket protector hanging on by a thread
- Old motivational wristband that says "OPTIMIZE YOUR LIFE" (ironic now)
- Carries a broken smartphone with Spanish error messages on screen

---

## After Generation Steps

Once you have Dave's sprite:

1. **Save as:** `dave_idle_right.png` in `assets/characters/`
2. **In Godot:**

   - Open `dave.tscn`
   - Add `Sprite2D` node as child of Dave
   - Load your character image
   - Delete the blue `ColorRect` placeholder
   - Adjust `Sprite2D` offset to center Dave properly
   - Add `CollisionShape2D` for click detection (capsule or rectangle around body)

3. **Test in scene** - Dave should now look like an actual character!

---

## Optional: Animation Frames (Later)

For walking animation, you'll eventually want:

- Idle pose (what we're making now)
- Walk cycle: 4-6 frames of walking animation
- Talking pose: mouth open/closed variations
- Interaction pose: reaching/picking up items

But start with one good idle pose first!

---

## Art Style Consistency Checklist

✅ Matches basement background warm earth tones  
✅ Same painterly brushwork style  
✅ Expressive, slightly exaggerated proportions (adventure game style)  
✅ Readable silhouette at small size  
✅ Character personality visible in posture/expression  
✅ Coordinates with established color palette (ochre, terracotta, dusty blues)

---

## Recommended DALL-E 3 Settings

- **Aspect Ratio:** Square (1:1) for character sprite
- **Style:** Vivid (for expressive colors matching background)
- **Quality:** Standard is fine for sprites
- **Multiple Variations:** Generate 2-3 versions, pick the best match

---

Good luck! Once you have Dave looking good, we can:

1. Replace the blue rectangle with real Dave sprite
2. Add collision shape for proper clicking
3. Maybe add simple walk animation
4. Test him walking around your beautiful basement!
