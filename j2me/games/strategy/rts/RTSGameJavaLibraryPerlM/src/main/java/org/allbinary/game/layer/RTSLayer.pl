# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package org::allbinary::game::layer::RTSLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer','org::allbinary::game::tick::TickableInterface','org::allbinary::game::input::GameInputInterface','org::allbinary::game::input::GameKeyEventSourceInterface','org::allbinary::game::layer::RTSInterface','org::allbinary::game::layer::PathFindingLayerInterface';

our $id = 0;
our $MAIN_INDEX = 0;
our $SECONDARY_INDEX = 1;

sub _init_fields {
    my ($self) = @_;
    $self->{debug} = 1;
    $self->{showMoreCaptionStates} = $self->{debug};
    $self->{inputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{rtsLayer2LogHelper} = 'org::allbinary::game::layer::RTSLayer2LogHelper'->getInstance();
    $self->{waypointLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointLogHelper'->getInstance();
    $self->{waypoint2LogHelperP} = 'org::allbinary::game::layer::waypoint::Waypoint2LogHelper'->getInstance();
    $self->{waypointRunnableLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper'->getInstance();
    $self->{rtsFormInput} = undef;
    $self->{verticleBuildAnimationInterface} = undef;
    $self->{rangeAnimation} = undef;
    $self->{initRangeAnimation} = undef;
    $self->{sensorRangeAnimation} = undef;
    $self->{initSensorRangeAnimation} = undef;
    $self->{baseAnimationInterface} = undef;
    $self->{buildFrameTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(50);
    $self->{buildAnimationInterface} = undef;
    $self->{animationInterface} = undef;
    $self->{initAnimationInterface} = undef;
    $self->{indexedButShouldBeRotationAnimationInterface} = undef;
    $self->{emptyAnimationInterface} = undef;
    $self->{destroyAnimationInterface} = undef;
    $self->{fireTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(700);
    $self->{rootName} = undef;
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{BUILD_VALUE} = 63;
    $self->{geographicMapCellPositionAreaBase} = undef;
    $self->{healthInterface} = $org::allbinary::game::health::Health::NULL_HEALTH;
    $self->{level} = 1;
    $self->{maxLevel} = 1;
    $self->{hackVerticleBuild} = $self->{BUILD_VALUE};
    $self->{slightAngle} = 0;
    $self->{percentCompleteP} = 0;
    $self->{destroyed} = 0;
    $self->{selected} = 0;
    $self->{rtsLayerUtil} = 'org::allbinary::game::layer::RTSLayerUtil'->getInstance();
    $self->{layerDistanceUtil} = 'org::allbinary::math::LayerDistanceUtil'->getInstance();
}


# throws Exception
sub createSimulatedInstance {
    my ($class, $remoteInfo) = @_;
        my $nullAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance();
        my $nullIndexedAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance();
        return 'org::allbinary::game::layer::RTSLayer'->new($org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, 'org::allbinary::game::identification::GroupFactory'->getInstance()->{NULL_GROUP_ARRAY}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::game::health::Health::NULL_HEALTH, 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance(), $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance(), $org::allbinary::graphics::RectangleFactory::SINGLETON, 0, 0, 'org::allbinary::game::view::TileLayerPositionIntoViewPosition'->new());
}


sub new {
    my ($class, $remoteInfo, $groupInterface, $rootName, $name, $healthInterface, $rtsFormInput, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, $viewPosition) = @_;
    my $self = $class->SUPER::new($remoteInfo, $groupInterface, $name, $rectangle, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->initInputProcessors();
        $self->{rootName} = $rootName;
        $self->{healthInterface} = $healthInterface;
        $self->{rtsFormInput} = $rtsFormInput;
        $self->setPosition($x, $y, $self->{z});
        $self->{verticleBuildAnimationInterface} = $verticleBuildAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{buildAnimationInterface} = $buildAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{baseAnimationInterface} = $baseAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{emptyAnimationInterface} = $emptyAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{indexedButShouldBeRotationAnimationInterface} = $animationInterfaceFactoryInterface->getInstance(0);
        $self->{initAnimationInterface} = $self->{indexedButShouldBeRotationAnimationInterface};
        $self->{destroyAnimationInterface} = $proceduralAnimationInterfaceFactoryInterface->getInstanceAnimation($self->{indexedButShouldBeRotationAnimationInterface});
        my $animation = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        $self->{rangeAnimation} = $animation;
        $self->{initRangeAnimation} = $animation;
        $self->{sensorRangeAnimation} = $animation;
        $self->{initSensorRangeAnimation} = $animation;
        $self->{animationInterface} = $self->{initAnimationInterface};
        $self->{geographicMapCellPositionAreaBase} = 'org::allbinary::game::layer::GeographicMapCellPositionArea'->new($self);
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $viewPosition2 = $self->getViewPosition();
        $viewPosition2->setTiledLayer($tiledLayer);
        $self->updateWaypointBehavior($geographicMapInterface);
}


# throws Exception
sub updateWaypointBehavior {
    my ($self, $geographicMapInterface) = @_;
        $self->{geographicMapCellPositionAreaBase}->update($geographicMapInterface);
}


# throws Exception
sub construct {
    my ($self, $rtsPlayerLayerInterface) = @_;
        'org::allbinary::view::event::ViewPositionEventHandler'->getInstance()->addListener($self);
        $self->{animationInterface} = $self->{buildAnimationInterface};
        $self->{hackVerticleBuild} = 0;
}


sub select {
    my ($self) = @_;
        $self->{rangeAnimation} = $self->{initRangeAnimation};
        $self->{sensorRangeAnimation} = $self->{initSensorRangeAnimation};
        $self->setSelected(1);
}


sub deselect {
    my ($self) = @_;
        my $animation = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        $self->{rangeAnimation} = $animation;
        $self->{sensorRangeAnimation} = $animation;
        $self->setSelected(0);
}


sub setSelected {
    my ($self, $selected) = @_;
        $self->{selected} = $selected;
}


sub isSelected {
    my ($self) = @_;
        return $self->{selected};
}


sub getPercentComplete {
    my ($self) = @_;
        return $self->{percentCompleteP};
}


sub getScrollSelectionForm {
    my ($self) = @_;
        return 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm();
}


sub initInputProcessors {
    my ($self) = @_;
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
}


# throws Exception
sub processBuiltTick {
    my ($self, $allBinaryLayerManager) = @_;
        $self->{animationInterface} = $self->{indexedButShouldBeRotationAnimationInterface};
}


sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        try {
            if ($self->isCompleted()) {
                $self->processBuiltTick($allBinaryLayerManager);
            } else {
                $self->build();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processTick", $e);
        }
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
}


sub reload {
    my ($self) = @_;
}


sub onMovement {
    my ($self, $trackingEvent) = @_;
}


# throws Exception
sub onMovementFound {
    my ($self, $trackingEvent) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintFirst($graphics);
        my $viewPosition = $self->getViewPosition();
        my $viewX = $viewPosition->getX();
        my $viewY = $viewPosition->getY();
        $self->getAnimationInterface()->paintXY($graphics, $viewX, $viewY);
}


# throws Exception
sub damage {
    my ($self, $damage, $damageType) = @_;
}


sub getSourceId {
    my ($self) = @_;
        return $org::allbinary::game::layer::RTSLayer::id;
}


sub downgrade {
    my ($self) = @_;
        $self->{rtsLayerUtil}->downgrade($self);
}


sub upgrade {
    my ($self) = @_;
        $self->{rtsLayerUtil}->upgrade($self);
}


sub isCompleted {
    my ($self) = @_;
        if ($self->{hackVerticleBuild} < $self->{BUILD_VALUE}) {
            return 0;
        } else {
            return 1;
        }
}


# throws Exception
sub build {
    my ($self) = @_;
        if ($self->{buildFrameTimeHelper}->isTimeTNT()) {
            $self->{animationInterface} = $self->{buildAnimationInterface};
            $self->{verticleBuildAnimationInterface}->nextFrame();
            $self->{hackVerticleBuild}++;
        }
        $self->{percentCompleteP} = int(100 * $self->{hackVerticleBuild} / $self->{BUILD_VALUE});
        $self->getHudPaintable()->updateInfo();
}


sub isSelfUpgradeable {
    my ($self) = @_;
        return 1;
}


sub getCost {
    my ($self) = @_;
        return $self->{rtsLayerUtil}->getCost($self);
}


sub getDowngradeCost {
    my ($self) = @_;
        return $self->{rtsLayerUtil}->getDowngradeCost($self);
}


sub getUpgradeCost {
    my ($self) = @_;
        return $self->{rtsLayerUtil}->getUpgradeCost($self);
}


sub isUpgradeable {
    my ($self) = @_;
        if ($self->getLevel() < $self->getMaxLevel()) {
            return 1;
        } else {
            return 0;
        }
}


sub isDowngradeable {
    my ($self) = @_;
        if ($self->getLevel() > 1) {
            return 1;
        } else {
            return 0;
        }
}


sub getLevel {
    my ($self) = @_;
        return $self->{level};
}


sub setLevel {
    my ($self, $level) = @_;
        $self->{level} = $level;
}


sub getVerticleBuildAnimationInterface {
    my ($self) = @_;
        return $self->{verticleBuildAnimationInterface};
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub setAnimationInterface {
    my ($self, $animationInterface) = @_;
        $self->{animationInterface} = $animationInterface;
}


# throws Exception
sub setTarget {
    my ($self, $targetGameLayer) = @_;
        my $anotherTargetDistance = $self->{layerDistanceUtil}->getDistance($self, $targetGameLayer);
        my $waypointBehaviorBase = $self->getWaypointBehavior();
        $waypointBehaviorBase->setTargetWithDistance($targetGameLayer, $anotherTargetDistance);
}


sub createHudPaintable {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getHudPaintable {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getMaxLevel {
    my ($self) = @_;
        return $self->{maxLevel};
}


sub setMaxLevel {
    my ($self, $maxLevel) = @_;
        $self->{maxLevel} = $maxLevel;
}


sub getHealthInterface {
    my ($self) = @_;
        return $self->{healthInterface};
}


sub setHealthInterface {
    my ($self, $healthInterface) = @_;
        $self->{healthInterface} = $healthInterface;
}


sub getRTSFormInput {
    my ($self) = @_;
        return $self->{rtsFormInput};
}


# throws Exception
sub isDestroyed {
    my ($self) = @_;
        return $self->{destroyed};
}


# throws Exception
sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{destroyed} = $destroyed;
        if ($self->isDestroyed()) {
            'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance()->add($self);
            'org::allbinary::view::event::ViewPositionEventHandler'->getInstance()->removeListener($self);
        }
}


sub getEndGeographicMapCellPositionList {
    my ($self) = @_;
        return $self->{geographicMapCellPositionAreaBase}->getOccupyingGeographicMapCellPositionList();
}


sub getGeographicMapCellPositionArea {
    my ($self) = @_;
        return $self->{geographicMapCellPositionAreaBase};
}


sub shouldHandleStartSameAsEnd {
    my ($self) = @_;
        return 1;
}


# throws Exception
sub handleCost {
    my ($self, $ownerLayer) = @_;
}


sub getWaypointBehavior {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getParentLayer {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getRTSLayer2LogHelper {
    my ($self) = @_;
        return $self->{rtsLayer2LogHelper};
}


sub getWaypointLogHelper {
    my ($self) = @_;
        return $self->{waypointLogHelperP};
}


sub getWaypoint2LogHelper {
    my ($self) = @_;
        return $self->{waypoint2LogHelperP};
}


sub getWaypointRunnableLogHelper {
    my ($self) = @_;
        return $self->{waypointRunnableLogHelperP};
}


sub shouldAddWaypointFromBuilding {
    my ($self) = @_;
        return 0;
}


sub getCaptionAnimationHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isShowMoreCaptionStates {
    my ($self) = @_;
        return $self->{showMoreCaptionStates};
}


# throws Exception
sub init {
    my ($self, $geographicMapCellHistory, $geographicMapCellPositionBasicArrayList) = @_;
}


# throws Exception
sub getCurrentGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getTopLeftGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getMoveOutOfBuildAreaPath {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setClosestGeographicMapCellHistory {
    my ($self, $pathsList) = @_;
}


sub teleportTo {
    my ($self, $geographicMapCellPosition) = @_;
}


# throws Exception
sub setLoad {
    my ($self, $resource) = @_;
}


# throws Exception
sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub trackTo {
    my ($self, $reason) = @_;
}


# throws Exception
sub trackToDXY {
    my ($self, $dx, $dy) = @_;
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        return 0;
}


sub getTrackingEvent {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub buildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
        return 0;
}


sub allStop {
    my ($self) = @_;
}


sub getMinStaticType {
    my ($class) = @_;
        return 1;
}


sub getMaxStaticType {
    my ($class) = @_;
        return 4;
}


sub isRTSLayer {
    my ($class, $layerInterface) = @_;
        if ($layerInterface->getType() >= 'org::allbinary::game::layer::RTSLayer'->getMinStaticType() && $layerInterface->getType() <= 'org::allbinary::game::layer::RTSLayer'->getMaxStaticType()) {
            return 1;
        }
        return 0;
}


sub implmentsTickableInterface {
    my ($self) = @_;
        return 1;
}


sub implmentsGameInputInterface {
    my ($self) = @_;
        return 1;
}


sub getRootName {
    my ($self) = @_;
        return $self->{rootName};
}


sub getRotationAnimationInterface {
    my ($self) = @_;
        return $self->{indexedButShouldBeRotationAnimationInterface};
}


sub setFrame {
    my ($self, $index) = @_;
        $self->getRotationAnimationInterface()->setFrame($index);
}


sub setRotationAnimationInterface {
    my ($self, $rotationAnimationInterface) = @_;
        $self->{indexedButShouldBeRotationAnimationInterface} = $rotationAnimationInterface;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::NullIndexedAnimationFactory;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::animation::caption::CaptionAnimationHelperBase;
use org::allbinary::game::combat::destroy::DestroyedLayerProcessor;
use org::allbinary::game::health::Health;
use org::allbinary::game::identification::Group;
use org::allbinary::game::identification::GroupFactory;
use org::allbinary::game::input::GameInputInterface;
use org::allbinary::game::input::GameInputProcessor;
use org::allbinary::game::input::GameInputProcessorUtil;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::layer::waypoint::Waypoint2LogHelper;
use org::allbinary::game::layer::waypoint::WaypointLogHelper;
use org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::view::event::ViewPositionEventHandler;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::LayerDistanceUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::RTSInterface;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayer2LogHelper;
use org::allbinary::game::layer::GeographicMapCellPositionArea;
use org::allbinary::game::layer::RTSLayerUtil;

1;

