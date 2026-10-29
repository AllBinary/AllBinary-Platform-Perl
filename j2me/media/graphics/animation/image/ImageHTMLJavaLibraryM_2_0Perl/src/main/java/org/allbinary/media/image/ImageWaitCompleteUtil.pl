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

package org::allbinary::media::image::ImageWaitCompleteUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::ImageCompleteUtil';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(18000);
    $self->{allTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(120000);
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub waitForImage {
    my ($self, $image, $name) = @_;
        $self->{timeDelayHelper}->setStartTimeTNT();
        $self->waitForATime($image, $name, $self->{timeDelayHelper});
}


# throws Exception
sub handleTimeout {
    my ($self, $name) = @_;
        if ($self->{timeDelayHelper}->isTimeTNT()) {
            die ("isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " . $name);
        }
}


# throws Exception
sub waitForATime {
    my ($self, $image, $name, $timeDelayHelper) = @_;
        my $playnImage = $image;
        my $playnCoreImage = $playnImage->getImage();
        while (!$playnCoreImage->isReady() || $playnCoreImage->width() + $playnCoreImage->height() <= 0) {
            if ($timeDelayHelper->isTimeTNT()) {
                die ("waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " . $name);
            }
        }
        if (!$image->isReady()) {
            $image->init($image->getImage());
        }
}


# throws Exception
sub waitForAll {
    my ($self) = @_;
        $self->{allTimeDelayHelper}->setStartTimeTNT();
        my $hashtable = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->getHashtableP();
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $size = scalar(@{$objectArray});
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Image Total: " . $size, $self, "waitForAll");
        for (my $index = 0; $index < $size; $index++) {
            $self->waitForATime($hashtable->get($objectArray->[$index]), $objectArray->[$index], $self->{allTimeDelayHelper});
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::HashtableUtil;
use org::microemu::device::playn::PlaynImage;
use playn::core::CoreImage;
use org::allbinary::media::image::ImageCompleteUtil;

1;

