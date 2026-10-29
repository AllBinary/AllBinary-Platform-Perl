#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::canvas::FullScreenUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::canvas::FullScreenUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::FullScreenUtil::instance;
}


# throws Exception
sub initOnRun {
    my ($self, $fullScreenInterface, $commandListener) = @_;
        ($fullScreenInterface)->waitOnNotify(0);
        if (defined($commandListener)) {
            $self->init($fullScreenInterface);
        }
}


sub init {
    my ($self, $fullScreenInterface) = @_;
        my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($mainFeatureFactory->{FULL_SCREEN})) {
            $fullScreenInterface->setFullScreenMode(1);
        } else {
            $fullScreenInterface->setFullScreenMode(0);
        }
}


sub isScreenChange {
    my ($self, $isFullScreen) = @_;
        my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($mainFeatureFactory->{FULL_SCREEN}) != $isFullScreen) {
            return 1;
        }
        return 0;
}


sub isScreenChangeCanvas {
    my ($self, $fullScreenInterface) = @_;
        return $self->isScreenChange($fullScreenInterface->isFullScreenMode());
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
# use javax::microedition::lcdui::CommandListener;

1;

