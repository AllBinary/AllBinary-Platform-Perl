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

package org::allbinary::media::image::ImageUnifierUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageUnifierUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageUnifierUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getDefaultConfiguration {
    my ($self) = @_;
        my $ge = 'org::allbinary::media::image::GraphicsEnvironment'->getLocalGraphicsEnvironment();
        my $gd = $ge->getDefaultScreenDevice();
        return $gd->getDefaultConfiguration();
}


sub getImage {
    my ($self, $bufferedImageArray, $imageUnifierProperties) = @_;
        my $newBufferedImage = $self->{imageUtil}->create($imageUnifierProperties->getWidth(), $imageUnifierProperties->getHeight());
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        $self->{logUtil}->putF("Setting Image - " . $commonLabels->{WIDTH_LABEL} . $newBufferedImage->getWidth() . $commonLabels->{HEIGHT_LABEL} . $newBufferedImage->getHeight(), $self, "getImage");
        my $g = $newBufferedImage->createGraphics();
        my $columnIndex = 0;
        my $rowIndex = 0;
        for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
            my $x = int($imageUnifierProperties->getImageUnifierCell()->getWidth()) * $columnIndex++;
            my $y = int($imageUnifierProperties->getImageUnifierCell()->getHeight()) * $rowIndex;
            $self->{logUtil}->putF("Adding Image: " . $index . " x: " . $x . " y: " . $y, $self, "getImage");
            $g->drawImage($bufferedImageArray->[$index], $x, $y, int($imageUnifierProperties->getImageUnifierCell()->getWidth()), int($imageUnifierProperties->getImageUnifierCell()->getHeight()), undef);
            my $totalColumnsMinusOne = (int($imageUnifierProperties->getColumns()) - 1);
            if ($columnIndex > $totalColumnsMinusOne) {
                $rowIndex++;
                $columnIndex = 0;
            }
        }
        $g->dispose();
        return $newBufferedImage;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::GraphicsEnvironment;

1;

