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
    $self->{ISREADY} = "isReady";
    $self->{COMPLETE} = "Image loading complete for: ";
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
}


# throws Exception
sub isReady {
    my ($self, $image, $name, $timeDelayHelper) = @_;
        my $playnImage = $image;
        my $playnCoreImage = $playnImage->getImage();
        if (!$playnCoreImage->isReady() || $playnCoreImage->width() + $playnCoreImage->height() <= 0) {
            $self->handleTimeout($name);
            return 0;
        }
        if (!$image->isReady()) {
            $image->init($image->getImage());
            if (!$image->isReady()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Waiting for Not Ready Image: " . $image->getName(), $self, $self->{ISREADY});
            }
        }
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{COMPLETE} . $image->getName(), $self, $commonStrings->{SUCCESS});
        return 1;
}


# throws Exception
sub handleTimeout {
    my ($self, $name) = @_;
}


# throws Exception
sub waitForAll {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::microemu::device::playn::PlaynImage;

1;

