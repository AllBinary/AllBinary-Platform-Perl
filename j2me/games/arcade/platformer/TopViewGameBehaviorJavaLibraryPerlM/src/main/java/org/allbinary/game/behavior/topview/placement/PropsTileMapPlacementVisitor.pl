# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::placement::PropsTileMapPlacementVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::placement::TileMapPlacementVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{randomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub visit {
    my ($self, $lastMap, $mapData) = @_;
        my $layerIndex = 0;
        my $tileLayer = ($lastMap->getLayer($layerIndex));
        my $mapArray = $tileLayer->getMapArray();
        my $size = scalar(@{$mapData});
        my $size2 = scalar(@{$mapData->[0]});
        for (my $index = 0; $index < $size; $index++) {
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                if ($mapArray->[$index]->[$index2] == 14) {
                } else {
                    $self->visit2($mapArray, $mapData, $index, $index2);
                }
                if ($index % 7 == 0) {
                    if ($mapArray->[$index]->[$index2] == 19) {
                        my $randomInt = $self->{randomFactory}->getAbsoluteNextIntAllowZero(3);
                        if ($randomInt == 0) {
                            $mapData->[$index]->[$index2] = 1;
                        } elsif ($randomInt == 1) {
                            $mapData->[$index]->[$index2] = 81;
                        } elsif ($randomInt == 2) {
                            $mapData->[$index]->[$index2] = 97;
                        }
                    } elsif ($mapArray->[$index]->[$index2] == 17) {
                        my $randomInt = $self->{randomFactory}->getAbsoluteNextIntAllowZero(3);
                        if ($randomInt == 0) {
                            $mapData->[$index]->[$index2] = 17;
                        } elsif ($randomInt == 1) {
                            $mapData->[$index]->[$index2] = 81;
                        } elsif ($randomInt == 2) {
                            $mapData->[$index]->[$index2] = 97;
                        }
                    }
                }
                if ($index2 % 7 == 0) {
                    if ($mapArray->[$index]->[$index2] == 34) {
                        my $randomInt = $self->{randomFactory}->getAbsoluteNextIntAllowZero(4);
                        if ($randomInt == 0) {
                            $mapData->[$index]->[$index2] = 33;
                        } elsif ($randomInt == 1) {
                            $mapData->[$index]->[$index2] = 65;
                        } elsif ($randomInt == 2) {
                            $mapData->[$index]->[$index2] = 81;
                        } elsif ($randomInt == 3) {
                            $mapData->[$index]->[$index2] = 97;
                        }
                    }
                }
            }
        }
}


sub visit2 {
    my ($self, $mapArray, $mapData, $index, $index2) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $countX = 0;
        my $countY = 0;
        my $index3 = $index - 1;
        for (my $index4 = $index2 - 1; $index4 > 0; $index4--) {
            $index3--;
            if ($index3 < 0 || $index4 < 0) {
                return;
            }
            if ($mapArray->[$index3]->[$index4] != 14 || $mapData->[$index3]->[$index4] != 0) {
                if ($countX > 10 && $countY > 10) {
                    for (my $index5 = $index3 + 1; $index5 < $index - 1; $index5++) {
                        for (my $index6 = $index4 + 1; $index6 < $index2 - 1; $index6++) {
                            if ($mapArray->[$index5]->[$index6] != 14 || $mapData->[$index5]->[$index6] != 0) {
                                return;
                            }
                        }
                    }
                    my $x = $index - (int($countX / 2));
                    my $y = $index2 - (int($countY / 2));
                    if ($x >= 0 && $y >= 0 && $x < scalar(@{$mapData}) && $y < scalar(@{$mapData->[0]})) {
                    }
                }
                return;
            }
            $countY++;
            $countX++;
        }
}

use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::mapeditor::core::TileLayer;
use org::mapeditor::core::TiledMap;
use org::allbinary::game::behavior::topview::placement::TileMapPlacementVisitor;

1;

