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

package org::allbinary::media::image::analysis::ImageAnalysis;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::analysis::ImageAnalysis'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::analysis::ImageAnalysis::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub process {
    my ($self, $bufferedImageArray, $colorRangeInterface) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $colorRangeInterface->toString(), $self, $commonStrings->{PROCESS});
        my $imageAnalysisResultsArray = [(undef) x (scalar(@{$bufferedImageArray}))];
        for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
            $imageAnalysisResultsArray->[$index] = 'org::allbinary::media::image::analysis::ImageAnalysis'->process($bufferedImageArray->[$index], $colorRangeInterface);
        }
        return $imageAnalysisResultsArray;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub process {
    my ($class, $bufferedImage, $colorRangeInterface) = @_;
        my $imageAnalysisResults = 'org::allbinary::media::image::analysis::ImageAnalysisResults'->new();
        my $redTotal = 0;
        my $greenTotal = 0;
        my $blueTotal = 0;
        for (my $indexY = 0; $indexY < $bufferedImage->getHeight(); $indexY++) {
            for (my $indexX = 0; $indexX < $bufferedImage->getWidth(); $indexX++) {
                my $keyInteger = ("" . ($bufferedImage->getRGB($indexX, $indexY)));
                my $colorCacheable = 'org::allbinary::graphics::color::ColorCacheFactory'->getInstance()->get($keyInteger);
                my $color = $colorCacheable->getColor();
                'org::allbinary::media::image::analysis::ImageAnalysis'->processColorRangeResults($imageAnalysisResults, $colorRangeInterface, $color);
                'org::allbinary::media::image::analysis::ImageAnalysis'->processImageColorResults($imageAnalysisResults->getImageColorResults(), $colorRangeInterface, $color);
                $redTotal += $color->getRed();
                $greenTotal += $color->getGreen();
                $blueTotal += $color->getBlue();
            }
        }
        my $totalPixels = $imageAnalysisResults->getImageColorRangeResults()->getTotalPixelsChecked();
        my $colorAverage = $imageAnalysisResults->getImageColorResults()->getColorAverage();
        $colorAverage->setAvgRed($redTotal / $totalPixels);
        $colorAverage->setAvgGreen($greenTotal / $totalPixels);
        $colorAverage->setAvgBlue($blueTotal / $totalPixels);
        return $imageAnalysisResults;
}


sub processColorRangeResults {
    my ($class, $imageAnalysisResults, $colorRangeInterface, $color) = @_;
        if ($colorRangeInterface->isInRange($color)) {
            $imageAnalysisResults->getImageColorRangeResults()->addMatchingPixelsChecked();
        } else {
        }
        $imageAnalysisResults->getImageColorRangeResults()->addTotalPixelsChecked();
}


sub processImageColorResults {
    my ($class, $imageColorResults, $colorRangeInterface, $color) = @_;
        if ($color->getRed() < $imageColorResults->getColorRange()->getMinRed()) {
            $imageColorResults->getColorRange()->setMinRed($color->getRed());
        }
        if ($color->getGreen() < $imageColorResults->getColorRange()->getMinGreen()) {
            $imageColorResults->getColorRange()->setMinGreen($color->getGreen());
        }
        if ($color->getBlue() < $imageColorResults->getColorRange()->getMinBlue()) {
            $imageColorResults->getColorRange()->setMinBlue($color->getBlue());
        }
        if ($color->getRed() > $imageColorResults->getColorRange()->getMaxRed()) {
            $imageColorResults->getColorRange()->setMaxRed($color->getRed());
        }
        if ($color->getGreen() > $imageColorResults->getColorRange()->getMaxGreen()) {
            $imageColorResults->getColorRange()->setMaxGreen($color->getGreen());
        }
        if ($color->getBlue() > $imageColorResults->getColorRange()->getMaxBlue()) {
            $imageColorResults->getColorRange()->setMaxBlue($color->getBlue());
        }
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::color::ColorCacheFactory;
use org::allbinary::graphics::color::ColorCacheable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::analysis::ImageAnalysisResults;

1;

