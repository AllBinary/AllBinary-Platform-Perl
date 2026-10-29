# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::unit::UnitWaypointBehavior2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::unit::UnitWaypointBehavior';

our $runningWaypointPathList = 'org::allbinary::util::BasicArrayListD'->new();
our $TARGET_DISTANCE = "Target Distance";
our $TARGET_LAYER = "Target Layer";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{unitWaypointStrings} = 'org::allbinary::game::layer::unit::UnitWaypointStrings'->getInstance();
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{layerDistanceUtil} = 'org::allbinary::math::LayerDistanceUtil'->getInstance();
    $self->{pathFindingThreadPool} = 'org::allbinary::thread::PathFindingThreadPool'->getInstance();
    $self->{progressTimeDelayHelper} = undef;
    $self->{wanderPathsList} = undef;
    $self->{waypointPathRunnable} = undef;
    $self->{sensorRange} = 0;
    $self->{closeRange} = 0;
    $self->{nextUnvisitedPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{afterNextUnvisitedPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{waitingOnTargetPath} = 0;
    $self->{waitingOnWaypointPath} = 0;
    $self->{targetWithoutCachedPathLayerInterface} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
    $self->{buildingSteeringVisitor} = 'org::allbinary::game::layer::unit::BuildingSteeringVisitor'->new();
}


sub new {
    my ($class, $ownerAdvancedRTSGameLayer, $fakeWaypoint) = @_;
    my $self = $class->SUPER::new($ownerAdvancedRTSGameLayer, $fakeWaypoint);
    $self->_init_fields();
        # super(...) made $self above
        $self->{progressTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(5000);
        $self->{wanderPathsList} = 'org::allbinary::util::BasicArrayListD'->new();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        $self->{waypointPathRunnable} = ('org::allbinary::J2MEUtil'->isHTML() ? 'org::allbinary::game::layer::MultipassWaypointPathRunnable'->new() : 'org::allbinary::game::layer::WaypointPathRunnable'->new());
    return $self;
}


sub initRange {
    my ($self, $weaponRange) = @_;
        $self->SUPER::initRange($weaponRange);
        $self->{closeRange} = $weaponRange;
        $self->{sensorRange} = $weaponRange * 4;
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->initRange($self->{associatedAdvancedRTSGameLayer}, $self->{closeRange}, $self->{sensorRange});
}


sub getNextUnvisitedPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{nextUnvisitedPathGeographicMapCellPosition};
}


sub isRunning {
    my ($self) = @_;
        if ($self->{waypointPathRunnable}->isRunning()) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{waypointPathRunnable}->isRunning()) {
            if ($self->{waypointPathsListP} != $org::allbinary::game::layer::unit::UnitWaypointBehavior2::runningWaypointPathList) {
                $self->{waypointPathRunnable}->setRunning(0);
                if ($self->{waitingOnTargetPath}) {
                    $self->setTargetPath();
                } elsif ($self->{waitingOnWaypointPath}) {
                    $self->setWaypointPath($self->{waypointPathRunnable}->getTargetLayer());
                } else {
                    die ("Should not happen");
                }
            } else {
                return;
            }
        }
        $self->processTargetList();
        if (!$self->{waypointPathRunnable}->isRunning()) {
            $self->processWaypoint();
        } else {
            return;
        }
        if (!$self->{waypointPathRunnable}->isRunning()) {
            $self->processTargeting();
        } else {
            return;
        }
        if (!$self->{waypointPathRunnable}->isRunning()) {
            $self->teleportIfNoProgress();
        } else {
            return;
        }
}


# throws Exception
sub onEnemyMovement {
    my ($self, $layerInterface) = @_;
        my $anotherTargetDistance = $self->{layerDistanceUtil}->getDistance($self->{associatedAdvancedRTSGameLayer}, $layerInterface);
        if ($layerInterface == $self->{currentTargetLayerInterfaceP}) {
            $self->setCurrentTargetDistance($anotherTargetDistance);
        } else {
            $self->processPossibleTarget($layerInterface, $anotherTargetDistance);
        }
}


# throws Exception
sub processPossibleTarget {
    my ($self, $layerInterface, $anotherTargetDistance) = @_;
        my $isShorterThanCurrentTargetDistance = $self->getCurrentTargetDistance() > $anotherTargetDistance;
        my $isCurrentTargetDestroyed = $self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance() && $self->{currentTargetLayerInterfaceP}->isDestroyed();
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processPossibleTarget($self->{associatedAdvancedRTSGameLayer}, $self, $layerInterface, $anotherTargetDistance, $isShorterThanCurrentTargetDistance, $isCurrentTargetDestroyed);
        if ($self->isWaypointListEmptyOrOnlyTargets() && $self->isInSensorRange($layerInterface, $anotherTargetDistance) && ($isShorterThanCurrentTargetDistance || $isCurrentTargetDestroyed)) {
            $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processSetTarget($self->{associatedAdvancedRTSGameLayer}, $self, $layerInterface, $anotherTargetDistance);
            $self->setTarget($layerInterface, $anotherTargetDistance);
        } elsif ($self->isCloseRange($layerInterface, $anotherTargetDistance) && ($isShorterThanCurrentTargetDistance || $isCurrentTargetDestroyed)) {
            $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processPossibleTargetCloser($self->{associatedAdvancedRTSGameLayer}, $self, $layerInterface, $anotherTargetDistance);
            $self->setTarget($layerInterface, $anotherTargetDistance);
        }
}


# throws Exception
sub teleportIfNoProgress {
    my ($self) = @_;
        if ($self->isTrackingWaypoint() || $self->{associatedAdvancedRTSGameLayer}->getParentLayer()->isDestroyed()) {
            if ($self->{progressTimeDelayHelper}->isTimeTNT() && $self->{nextUnvisitedPathGeographicMapCellPosition} != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                $self->{associatedAdvancedRTSGameLayer}->teleportTo($self->{nextUnvisitedPathGeographicMapCellPosition});
            }
            if ($self->getCompleteTimeDelayHelper()->isTimeTNT()) {
                my $geographicMapCellPosition = $self->{currentGeographicMapCellHistoryP}->getTracked()->get($self->{currentGeographicMapCellHistoryP}->getSize() - 1);
                $self->{associatedAdvancedRTSGameLayer}->teleportTo($geographicMapCellPosition);
            }
        }
}


# throws Exception
sub setTarget {
    my ($self, $layerInterface, $anotherTargetDistance) = @_;
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->setTarget($self->{associatedAdvancedRTSGameLayer}, $self, $layerInterface, $anotherTargetDistance);
        $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{TARGET}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREEN});
        $self->{associatedAdvancedRTSGameLayer}->setLoad(0);
        $self->setCurrentTargetDistance($anotherTargetDistance);
        $self->setCurrentTargetLayerInterface($layerInterface);
        $self->setTrackingWaypoint(0);
        $self->{targetList}->clear();
        if (!$self->isCloseRange($layerInterface, $anotherTargetDistance) && $self->canInsertWaypoint(0, $self->{currentTargetLayerInterfaceP})) {
            my $geographicMapCellPosition = $self->{associatedAdvancedRTSGameLayer}->getCurrentGeographicMapCellPosition();
            my $pathFindingLayerInterface = ($self->{currentTargetLayerInterfaceP});
            my $waypoint = $pathFindingLayerInterface->getWaypointBehavior()->getWaypoint();
            my $list = $waypoint->getPathsListFromCacheOnly($geographicMapCellPosition);
            $self->setWaypointPathsList($list);
            if (!defined($self->{waypointPathsListP})) {
                $self->{targetWithoutCachedPathLayerInterface} = $self->{currentTargetLayerInterfaceP};
            } elsif ($self->{waypointPathsListP}->size() != 0) {
                $self->setTargetPath();
            }
        }
}


# throws Exception
sub setTargetPath {
    my ($self) = @_;
        if ($self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            if ($self->{currentTargetLayerInterfaceP}->isDestroyed()) {
                $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->setTargetPath($self->{associatedAdvancedRTSGameLayer});
                $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{KILL}, $self->{basicColorFactory}->{ORANGE});
                $self->clearTarget();
                return;
            }
            if ($self->{currentTargetLayerInterfaceP} == $self->{waypointPathRunnable}->getTargetLayer()) {
                $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->setTargetPathIgnoreNewPath($self->{associatedAdvancedRTSGameLayer}, $self);
                $self->insertWaypoint(0, $self->{currentTargetLayerInterfaceP});
                $self->setRandomGeographicMapCellHistory($self->{waypointPathsListP});
            }
        }
}


# throws Exception
sub setGeographicMapCellHistoryPath {
    my ($self, $geographicMapCellPositionBasicArrayList) = @_;
        $self->setCurrentPathGeographicMapCellPosition($org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION);
        $self->{nextUnvisitedPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        $self->SUPER::setGeographicMapCellHistoryPath($geographicMapCellPositionBasicArrayList);
}


# throws Exception
sub processWaypoint {
    my ($self) = @_;
        my $size = $self->{targetList}->size();
        if ($size > 0) {
            my $targetLayer = $self->{targetList}->get(0);
            $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processWaypoint($self->{associatedAdvancedRTSGameLayer}, $self, $targetLayer, $size);
            if ($targetLayer->isDestroyed()) {
                $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{WAYPOINT_DESTROYED_SHORT}, $self->{basicColorFactory}->{YELLOW});
                $self->removeWaypoint($targetLayer, $self->{unitWaypointStrings}->{WAYPOINT_DESTROYED});
            } else {
                my $geographicMapCellPosition = $self->{associatedAdvancedRTSGameLayer}->getCurrentGeographicMapCellPosition();
                if ($self->isTrackingWaypoint()) {
                    $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processWaypointTracked($self->{associatedAdvancedRTSGameLayer}, $self);
                    if ($self->visitIfAtMidPoint($geographicMapCellPosition)) {
                        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processWaypointTrackedVisit($self->{associatedAdvancedRTSGameLayer}, $geographicMapCellPosition);
                    }
                    if ($self->{currentGeographicMapCellHistoryP}->isAllVisited2() && $self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
                        my $oldWaypointLayer = $self->{currentTargetLayerInterfaceP};
                        $oldWaypointLayer->getWaypointBehavior()->getWaypoint()->visit($self->{associatedAdvancedRTSGameLayer});
                        $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{ALL_VISITED_SHORT}, $self->{basicColorFactory}->{GREEN});
                        $self->removeWaypoint($self->{currentTargetLayerInterfaceP}, $self->{unitWaypointStrings}->{ALL_VISITED});
                    }
                } elsif (!defined($self->{currentTargetLayerInterfaceP}) || $self->{waypointOverridesAttacking}) {
                    my $list = $targetLayer->getWaypointBehavior()->getWaypoint()->getPathsListFromCacheOnly($geographicMapCellPosition);
                    $self->setWaypointPathsList($list);
                    if (!defined($self->{waypointPathsListP})) {
                        $self->{waitingOnWaypointPath} = 1;
                        $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{THINKING}, $self->{basicColorFactory}->{GREEN});
                        $self->runWaypointPathTask($targetLayer);
                        return;
                    }
                    $self->setWaypointPath($targetLayer);
                }
            }
        }
}


# throws Exception
sub wander {
    my ($self) = @_;
        if ($self->{currentGeographicMapCellHistoryP}->isAllVisited2()) {
            $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->wander($self->{associatedAdvancedRTSGameLayer});
            $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{WANDERING}, $self->{basicColorFactory}->{RED});
            $self->{wanderPathsList}->clear();
            $self->{wanderPathsList}->add($self->{associatedAdvancedRTSGameLayer}->getSurroundingGeographicMapCellPositionList());
            $self->setRandomGeographicMapCellHistory($self->{wanderPathsList});
        }
        $self->visitIfAtMidPoint($self->getCurrentPathGeographicMapCellPosition());
        $self->updateCurrentPathGeographicMapCellPosition();
        $self->{associatedAdvancedRTSGameLayer}->trackTo($self->{unitWaypointStrings}->{NEXT_PATH_NODE});
}


sub visitIfAtMidPoint {
    my ($self, $geographicMapCellPosition) = @_;
        my $unitLayer = $self->{associatedAdvancedRTSGameLayer};
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && $self->{nextUnvisitedPathGeographicMapCellPosition} == $geographicMapCellPosition) {
            my $point = $geographicMapCellPosition->getMidPoint();
            my $afterNextPoint = $self->{afterNextUnvisitedPathGeographicMapCellPosition}->getMidPoint();
            my $beyondMidPoint = 1;
            if ($geographicMapCellPosition->getColumn() == $self->{afterNextUnvisitedPathGeographicMapCellPosition}->getColumn()) {
            } elsif ($point->getX() < $afterNextPoint->getX()) {
                if ($unitLayer->getXP() + $unitLayer->getHalfWidth() < $point->getX()) {
                    $beyondMidPoint = 0;
                }
            } else {
                if ($unitLayer->getXP() + $unitLayer->getHalfWidth() > $point->getX()) {
                    $beyondMidPoint = 0;
                }
            }
            if ($geographicMapCellPosition->getRow() == $self->{afterNextUnvisitedPathGeographicMapCellPosition}->getRow()) {
            } elsif ($point->getY() < $afterNextPoint->getY()) {
                if ($unitLayer->getYP() + $unitLayer->getHalfHeight() < $point->getY()) {
                    $beyondMidPoint = 0;
                }
            } else {
                if ($unitLayer->getYP() + $unitLayer->getHalfHeight() > $point->getY()) {
                    $beyondMidPoint = 0;
                }
            }
            if ($beyondMidPoint) {
                return $self->{currentGeographicMapCellHistoryP}->visit($geographicMapCellPosition);
            }
        }
        return 0;
}


# throws Exception
sub processTargetList {
    my ($self) = @_;
        $self->{targetWithoutCachedPathLayerInterface} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
        for (my $index = $self->getPossibleTargetList()->size() - 1; $index >= 0; $index--) {
            my $layerInterface = $self->getPossibleTargetList()->get($index);
            if ($layerInterface->isDestroyed()) {
                $self->getPossibleTargetList()->remove($layerInterface);
            } else {
                $self->onEnemyMovement($layerInterface);
            }
        }
        if ($self->{targetWithoutCachedPathLayerInterface} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->{waitingOnTargetPath} = 1;
            $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{THINKING_ABOUT_TARGET}, $self->{basicColorFactory}->{GREEN});
            $self->runWaypointPathTask($self->{currentTargetLayerInterfaceP});
        }
        $self->getPossibleTargetList()->clear();
}


# throws Exception
sub processTargeting {
    my ($self) = @_;
        if ($self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance() && ($self->isInSensorRange($self->{currentTargetLayerInterfaceP}, $self->getCurrentTargetDistance()) || $self->isTrackingWaypoint())) {
            if ($self->{currentTargetLayerInterfaceP}->isDestroyed()) {
                $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->targetDestroyed($self->{associatedAdvancedRTSGameLayer});
                $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{KILL}, $self->{basicColorFactory}->{ORANGE});
                $self->clearTarget();
                return;
            }
            my $dx = 0;
            my $dy = 0;
            if ($self->isTrackingWaypoint()) {
                $self->updateCurrentPathGeographicMapCellPosition();
                my $point = $self->{nextUnvisitedPathGeographicMapCellPosition}->getMidPoint();
                $dx = $self->{associatedAdvancedRTSGameLayer}->getXP() + $self->{associatedAdvancedRTSGameLayer}->getHalfWidth() - $point->getX();
                $dy = $self->{associatedAdvancedRTSGameLayer}->getYP() + $self->{associatedAdvancedRTSGameLayer}->getHalfHeight() - $point->getY();
                $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processTargeting($self->{associatedAdvancedRTSGameLayer}, $dx, $dy);
            } else {
                $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->processTargetingNonWayPoint($self->{associatedAdvancedRTSGameLayer}, $dx, $dy);
                $dx = ($self->{associatedAdvancedRTSGameLayer}->getXP() + $self->{associatedAdvancedRTSGameLayer}->getHalfWidth()) - ($self->{currentTargetLayerInterfaceP}->getXP() + $self->{currentTargetLayerInterfaceP}->getHalfWidth());
                $dy = ($self->{associatedAdvancedRTSGameLayer}->getYP() + $self->{associatedAdvancedRTSGameLayer}->getHalfHeight()) - ($self->{currentTargetLayerInterfaceP}->getYP() + $self->{currentTargetLayerInterfaceP}->getHalfHeight());
            }
            $self->{associatedAdvancedRTSGameLayer}->trackToDXY($dx, $dy);
        } else {
            if ($self->{associatedAdvancedRTSGameLayer}->getParentLayer()->isDestroyed()) {
                $self->wander();
            } else {
                if ($self->{associatedAdvancedRTSGameLayer}->{showMoreCaptionStates}) {
                    $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{STOP}, $self->{basicColorFactory}->{YELLOW});
                }
                $self->{associatedAdvancedRTSGameLayer}->allStop();
            }
        }
}


sub updateCurrentPathGeographicMapCellPosition {
    my ($self) = @_;
        $self->setLastPathGeographicMapCellPosition($self->getCurrentPathGeographicMapCellPosition());
        $self->setCurrentPathGeographicMapCellPosition($self->{nextUnvisitedPathGeographicMapCellPosition});
        $self->{nextUnvisitedPathGeographicMapCellPosition} = $self->{currentGeographicMapCellHistoryP}->getFirstUnvisited();
        $self->{afterNextUnvisitedPathGeographicMapCellPosition} = $self->{currentGeographicMapCellHistoryP}->getAfterIfNotLast($self->{nextUnvisitedPathGeographicMapCellPosition});
        if ($self->getCurrentPathGeographicMapCellPosition() != $self->{nextUnvisitedPathGeographicMapCellPosition}) {
            $self->{progressTimeDelayHelper}->setStartTimeTNT();
        }
}


# throws Exception
sub setWaypointPath {
    my ($self, $waypointLayer) = @_;
        if ($self->{waypointPathsListP}->size() != 0) {
            $self->setCurrentTargetLayerInterface($waypointLayer);
            my $MAX = 2147483647;
            $self->setCurrentTargetDistance($MAX);
            $self->setRandomGeographicMapCellHistory($self->{waypointPathsListP});
        } else {
            $waypointLayer->getWaypointBehavior()->getWaypoint()->visit($self->{associatedAdvancedRTSGameLayer});
            $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($self->{unitWaypointStrings}->{ALREADY_THERE_SHORT}, $self->{basicColorFactory}->{YELLOW});
            $self->removeWaypoint($waypointLayer, $self->{unitWaypointStrings}->{ALREADY_THERE});
        }
}


# throws Exception
sub runWaypointPathTask {
    my ($self, $waypointLayer) = @_;
        $self->setWaypointPathsList($org::allbinary::game::layer::unit::UnitWaypointBehavior2::runningWaypointPathList);
        if ($self->{waypointPathRunnable}->isRunning()) {
            die ("Should never be running here");
        }
        $self->{waypointPathRunnable}->setRunning(1);
        $self->{waypointPathRunnable}->setUnitLayer($self->{associatedAdvancedRTSGameLayer});
        $self->{waypointPathRunnable}->setTargetLayer($waypointLayer);
        $self->{pathFindingThreadPool}->runTask($self->{waypointPathRunnable});
}


# throws Exception
sub removeWaypoint {
    my ($self, $waypointLayer, $reason) = @_;
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->removeWaypoint($self->{associatedAdvancedRTSGameLayer}, $self, $waypointLayer, $reason);
        $self->{targetList}->remove($waypointLayer);
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->removeWaypointList($self->{associatedAdvancedRTSGameLayer}, $self, $self->{targetList});
        if ($self->{currentTargetLayerInterfaceP} == $waypointLayer) {
            $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->removeWaypointClear($self->{associatedAdvancedRTSGameLayer});
            $self->clearTarget();
        }
}


# throws Exception
sub clearTarget {
    my ($self) = @_;
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->clearTarget($self->{associatedAdvancedRTSGameLayer});
        $self->setCurrentTargetLayerInterface('org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance());
        $self->setTrackingWaypoint(0);
        my $MAX = 2147483647;
        $self->setCurrentTargetDistance($MAX);
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->fireEvent($self->{associatedAdvancedRTSGameLayer}->getTrackingEvent());
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        my $list = $self->{targetList};
        if ($list->size() == 0) {
            return 1;
        }
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $layerInterface = $list->get($index);
            if ($layerInterface->isWaypointListEmptyOrOnlyTargets()) {
                return 0;
            }
        }
        return 1;
}


sub isCloseRange {
    my ($self, $layerInterface, $targetDistance) = @_;
        return $targetDistance < $self->{closeRange} + $layerInterface->getHalfHeight();
}


sub isInSensorRange {
    my ($self, $layerInterface, $targetDistance) = @_;
        return $targetDistance < $self->{sensorRange} + $layerInterface->getHalfHeight();
}


sub getCurrentTargetingStateString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $stringBuffer->append($org::allbinary::game::layer::unit::UnitWaypointBehavior2::TARGET_LAYER);
            $stringBuffer->append($self->{commonSeps}->{SPACE});
            $stringBuffer->append($self->{currentTargetLayerInterfaceP}->getName());
            $stringBuffer->append(" with ");
            $stringBuffer->append($org::allbinary::game::layer::unit::UnitWaypointBehavior2::TARGET_DISTANCE);
            $stringBuffer->append($self->{commonSeps}->{SPACE});
            $stringBuffer->appendint(int($self->getCurrentTargetDistance()));
        }
        return $stringBuffer->toString();
}


# throws Exception
sub addWaypointFromUser {
    my ($self, $advancedRTSGameLayer) = @_;
        if ($advancedRTSGameLayer->isDestroyed()) {
            die ("Trying to add a dead: " . $advancedRTSGameLayer);
        }
        $self->{associatedAdvancedRTSGameLayer}->{waypoint2LogHelperP}->addWaypointFromUser($self->{associatedAdvancedRTSGameLayer}, $advancedRTSGameLayer);
        $self->{targetList}->clear();
        $self->{targetList}->add($advancedRTSGameLayer);
        $self->clearTarget();
}


# throws Exception
sub addBuildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
        if (!$self->{buildingSteeringVisitor}->getList()->contains($allbinaryLayer)) {
            $self->{buildingSteeringVisitor}->getList()->add($allbinaryLayer);
            $self->{buildingSteeringVisitor}->getPositionList()->add($cellPosition);
        }
        if (!$self->getSteeringVisitorList()->contains($self->{buildingSteeringVisitor})) {
            $self->getSteeringVisitorList()->add($self->{buildingSteeringVisitor});
        }
}


# throws Exception
sub buildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
        return $self->{associatedAdvancedRTSGameLayer}->buildingChase($allbinaryLayer, $cellPosition);
}
{
    package org::allbinary::game::layer::unit::BuildingSteeringVisitor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::game::layer::SteeringVisitor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{positionList} = 'org::allbinary::util::BasicArrayListD'->new();
    }

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
        return $self;
    }
    

    sub visit {
        my ($self, $anyType) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            try {
                if ($self->getList()->size() > 0) {
                    my $allbinaryLayer = $self->getList()->get(0);
                    my $cellPosition = $self->getPositionList()->get(0);
                    my $clear = $self->buildingChase($allbinaryLayer, $cellPosition);
                    if ($clear) {
                        $self->getList()->clear();
                        $self->{positionList}->clear();
                        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
                    }
                    return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
                }
                return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $self, "visit", $e);
                return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
            }
    }
    

    sub getPositionList {
        my ($self) = @_;
            return $self->{positionList};
    }
    }


use org::allbinary::J2MEUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::layer::SteeringVisitor;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::MultipassWaypointPathRunnable;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::WaypointPathRunnable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::WaypointPathRunnableBase;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::layer::waypoint::WaypointBase;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::math::LayerDistanceUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::thread::PathFindingThreadPool;
use org::allbinary::thread::ThreadPool;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::game::layer::unit::UnitWaypointBehavior;
use org::allbinary::game::layer::unit::UnitWaypointStrings;

1;

