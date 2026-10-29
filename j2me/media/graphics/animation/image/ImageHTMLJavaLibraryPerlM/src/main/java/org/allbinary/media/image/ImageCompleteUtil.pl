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

package org::allbinary::media::image::ImageCompleteUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageCompleteUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(18000);
    $self->{allTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(120000);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageCompleteUtil::instance;
}


# throws Exception
sub waitForImage {
    my ($self, $image, $name) = @_;
        $self->{timeDelayHelper}->setStartTime();
        $self->waitForATime($image, $name, $self->{timeDelayHelper});
}


# throws Exception
sub isReady {
    my ($self, $image, $name, $timeDelayHelper) = @_;
        my $playnImage = $image;
        if (!$playnImage->getImage()->isReady() && $playnImage->getImage()->width() + $playnImage->getImage()->height() == 0) {
            if ($timeDelayHelper->isTime()) {
                die ("isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " . $name);
            }
            return 0;
        }
        return 1;
}


# throws Exception
sub waitForATime {
    my ($self, $image, $name, $timeDelayHelper) = @_;
        my $playnImage = $image;
        while (!$playnImage->getImage()->isReady() && $playnImage->getImage()->width() + $playnImage->getImage()->height() == 0) {
            if ($timeDelayHelper->isTime()) {
                die ("waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " . $name);
            }
        }
}


# throws Exception
sub waitForAll {
    my ($self) = @_;
        $self->{allTimeDelayHelper}->setStartTime();
        my $hashtable = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->getHashtable();
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $size = scalar(@{$objectArray});
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Total: " . $size, $self, "waitForAll");
        for (my $index = 0; $index < $size; $index++) {
            $self->waitForATime($hashtable->get($objectArray->[$index]), $objectArray->[$index], $self->{allTimeDelayHelper});
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::HashtableUtil;
use org::microemu::device::playn::PlaynImage;

1;

