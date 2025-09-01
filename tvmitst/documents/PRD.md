# Spanish Learning Adventure Game - Product Requirements Document

## Project Overview

**Game Title:** "This Very Moment Is The Spanish Teacher" (TVMITST)
**Genre:** 2D Adventure/Educational Game
**Target Platform:** Desktop (Godot 4.3)
**Art Style:** Pixelated 2D inspired by Paco Pomet, Wayne White, and Jon-Michael Frank
**Game Influences:** Monkey Island, Sam & Max, Grim Fandango, Sierra adventure games

## Vision Statement

Create an immersive Spanish language learning adventure game that combines the charm and humor of classic point-and-click adventures with effective language learning mechanics. Players explore a surreal, artistic world where every moment becomes a Spanish teacher, naturally acquiring vocabulary and grammar through interactive storytelling and engaging minigames.

## Core Learning Objectives

### Primary Goals

- **Vocabulary Acquisition**: Learn 500+ Spanish words across common categories
- **Gender Recognition**: Master el/la articles with nouns
- **Contextual Learning**: Understand words through visual and narrative context
- **Progressive Difficulty**: Gradual introduction of complex grammar concepts

### Learning Mechanics

- **Contextual Word Replacement**: English words gradually transform to Spanish in dialogue and descriptions
- **Story-Driven Introduction**: New vocabulary emerges naturally through character interactions and plot progression
- **Adventure Game Integration**: Puzzles require Spanish comprehension to solve
- **Immersive Transition**: Players don't realize they're learning until they're thinking in Spanish
- **Choice-Based Learning**: Players must choose correct Spanish responses to advance story

## Game Design Philosophy

### Art Direction

- **Surreal Realism**: Inspired by Paco Pomet's dreamlike scenarios
- **Handcrafted Aesthetic**: Wayne White's sculptural, tactile approach
- **Narrative Illustration**: Jon-Michael Frank's storytelling through imagery
- **Pixel Art Style**: 32x32 base sprites with detailed animations
- **Color Psychology**: Warm, inviting palette that reduces learning anxiety

### Narrative Approach

- **Humor-Driven**: Light-hearted tone reduces language learning stress
- **Cultural Integration**: Spanish-speaking world contexts and references
- **Character-Driven**: Memorable NPCs that embody different Spanish dialects
- **Mystery Elements**: Adventure game puzzles that require Spanish comprehension
- **Gradual Immersion**: Story begins in English, slowly transitions to Spanish as player learns
- **Contextual Discovery**: Players discover word meanings through story context, not explicit teaching

## Technical Specifications

### Engine & Platform

- **Engine**: Godot 4.3
- **Language**: GDScript
- **Resolution**: 1920x1080 (scalable)
- **Frame Rate**: 60 FPS
- **Audio**: OGG Vorbis format
- **Localization**: English UI with Spanish learning content

### Architecture

- **Scene-Based Structure**: Modular areas for easy content addition
- **Component System**: Reusable learning objects and UI elements
- **Save System**: Progress tracking and vocabulary mastery
- **Analytics**: Learning progress and difficulty adjustment

## Core Features

### 1. Player Movement System

- **8-Directional Movement**: WASD/Arrow key controls
- **Smooth Physics**: 300 pixels/second base speed
- **Collision Detection**: Proper world interaction
- **Animation States**: Walking, idle, interaction poses

### 2. Learning Object System

- **Interactive Items**: Clickable objects that teach vocabulary
- **State Management**: Visual feedback for learning progress
- **Word Categories**: Nouns, verbs, adjectives, phrases
- **Gender System**: Visual cues for el/la articles

### 3. Dialogue System

- **Bilingual Conversations**: Spanish with English translations
- **Voice Acting**: Native Spanish speaker recordings
- **Text Speed Control**: Adjustable reading pace
- **Subtitle Options**: Spanish, English, or both

### 4. Minigame Collection

- **Word Matching**: Connect Spanish/English pairs
- **Scene Description**: Describe what you see in Spanish
- **Conversation Practice**: Choose appropriate responses
- **Memory Games**: Recall vocabulary from previous areas

### 5. Progress Tracking

- **Vocabulary Journal**: Track learned words and phrases
- **Mastery Levels**: Bronze, Silver, Gold for each word
- **Achievement System**: Milestones and learning streaks
- **Statistics Dashboard**: Learning analytics and insights

## Game World Design

### Setting: "El Pueblo Surrealista"

A magical Spanish-speaking town where reality bends in delightful ways, inspired by magical realism literature and surrealist art.

### Key Locations

#### 1. Plaza Central (Tutorial Area)

- **Learning Focus**: Basic greetings, numbers, colors
- **Art Style**: Paco Pomet-inspired floating objects and impossible architecture
- **NPCs**: Friendly townspeople who introduce core mechanics
- **Minigames**: Simple word matching and pronunciation practice

#### 2. Mercado Fantástico (Marketplace)

- **Learning Focus**: Food vocabulary, shopping phrases, quantities
- **Art Style**: Wayne White's sculptural market stalls with exaggerated proportions
- **NPCs**: Animated vendors selling impossible items
- **Minigames**: Shopping simulations, price negotiations

#### 3. Casa de los Espejos (House of Mirrors)

- **Learning Focus**: Family members, body parts, descriptions
- **Art Style**: Jon-Michael Frank's narrative illustrations come to life
- **NPCs**: Mirror reflections that speak different Spanish dialects
- **Minigames**: Description challenges, family tree puzzles

#### 4. Biblioteca Flotante (Floating Library)

- **Learning Focus**: Past tense, storytelling, literature
- **Art Style**: Books and words floating in impossible spaces
- **NPCs**: Literary characters from Spanish literature
- **Minigames**: Story completion, verb conjugation adventures

#### 5. Jardín del Tiempo (Garden of Time)

- **Learning Focus**: Future tense, plans, dreams, aspirations
- **Art Style**: Plants that grow backwards, seasonal impossibilities
- **NPCs**: Gardeners who plant words instead of seeds
- **Minigames**: Timeline puzzles, future scenario planning

## User Experience Design

### Onboarding Flow

1. **Welcome Screen**: Art style introduction and learning goals
2. **Movement Tutorial**: Basic controls in safe environment
3. **First Interaction**: Simple learning object demonstration
4. **Dialogue Introduction**: Meet first NPC and practice conversation
5. **Minigame Tutorial**: Complete first learning challenge

### Learning Progression

- **Gentle Curve**: Start with 5-10 words per area
- **Contextual Introduction**: New words appear in meaningful situations
- **Immediate Practice**: Use new vocabulary within 2-3 interactions
- **Spaced Review**: Previous words reappear in new contexts
- **Mastery Confirmation**: Multiple successful uses mark words as "learned"

### Accessibility Features

- **Colorblind Support**: Pattern-based state indicators
- **Hearing Impaired**: Full subtitle support with visual cues
- **Motor Accessibility**: Customizable controls and click targets
- **Learning Disabilities**: Adjustable text speed and repetition options

## Monetization Strategy

### Initial Release

- **Premium Game**: One-time purchase ($19.99)
- **Complete Experience**: All content included
- **No Microtransactions**: Focus on learning, not spending

### Future Expansions

- **Additional Worlds**: New themed areas (beach, mountains, city)
- **Advanced Grammar**: Subjunctive mood, complex tenses
- **Cultural Packs**: Regional dialects and cultural contexts
- **Multiplayer Mode**: Cooperative learning with friends

## Success Metrics

### Learning Effectiveness

- **Vocabulary Retention**: 80% retention rate after 1 week
- **Completion Rate**: 60% of players finish first world
- **Engagement Time**: Average 45-minute play sessions
- **Learning Progression**: 50 new words learned per hour of play

### Player Satisfaction

- **User Reviews**: Target 4.5+ stars on platforms
- **Recommendation Rate**: 70% would recommend to friends
- **Return Rate**: 80% return within 48 hours
- **Community Growth**: Active Discord/forum participation

## Development Timeline

### Phase 1: Core Systems (Weeks 1-4)

- Player movement and basic interactions
- Learning object system implementation
- Basic UI and progress tracking
- First area (Plaza Central) complete

### Phase 2: Content Creation (Weeks 5-8)

- Complete dialogue system
- First minigame collection
- Art asset creation and integration
- Audio implementation (music and SFX)

### Phase 3: World Building (Weeks 9-12)

- Complete all five main areas
- NPC implementation and dialogue
- Advanced minigames
- Save system and progress tracking

### Phase 4: Polish & Testing (Weeks 13-16)

- Playtesting and balancing
- Bug fixes and optimization
- Accessibility features
- Marketing materials and store presence

## Risk Assessment

### Technical Risks

- **Godot Learning Curve**: Mitigation through documentation and tutorials
- **Performance Optimization**: Regular profiling and testing
- **Cross-Platform Compatibility**: Focus on desktop first, mobile later

### Design Risks

- **Learning Effectiveness**: Regular testing with Spanish learners
- **Engagement Balance**: Avoid making learning feel like work
- **Content Scope**: Start small, expand based on feedback

### Market Risks

- **Educational Game Market**: Research successful titles and differentiation
- **Spanish Learning Competition**: Focus on unique art style and adventure elements
- **Platform Visibility**: Strong marketing and community building

## Conclusion

"This Very Moment Is The Spanish Teacher" represents an innovative approach to language learning games, combining the beloved mechanics of classic adventure games with effective educational design. By focusing on artistic excellence, engaging storytelling, and proven learning techniques, we aim to create a game that players love to play and naturally learn from.

The surreal art style and humor-driven narrative will differentiate us in the educational game market, while the solid technical foundation ensures a smooth, enjoyable experience that encourages continued learning and exploration.
