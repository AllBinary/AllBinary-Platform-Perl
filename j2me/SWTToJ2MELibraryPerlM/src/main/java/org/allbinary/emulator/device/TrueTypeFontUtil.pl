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

#TTF
package org::allbinary::emulator::device::TrueTypeFontUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::emulator::device::TrueTypeFontUtilBase';

our $instance = 'org::allbinary::emulator::device::TrueTypeFontUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{preResourceImageUtil} = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
    $self->{widthFloatArray} = undef;
    $self->{fontImage} = $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE;
    $self->{widthScale} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::device::TrueTypeFontUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(2);
    $self->_init_fields();
        # super(...) made $self above
        if ('org::allbinary::AvianUtil'->isAvian()) {
            $self->{widthFloatArray} = [1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 961.0, 961.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 952.0, 952.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0];
        } else {
            $self->{widthFloatArray} = [1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0];
        }
        $self->{widthScale} = (($self->{scale} == 2) ? 1.2 : 1);
    return $self;
}


sub getFontBitmapGL {
    my ($self, $gl, $filename, $cellSize, $basicColor) = @_;
        try {
            if ($self->{fontImage} == $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE) {
                my $canvasStrings = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
                my $openGLCapabilities = 'org::allbinary::graphics::opengles::OpenGLCapabilities'->getInstance();
                if ($openGLCapabilities->isTextureSizeValid(1024) && $self->{scale} == 2) {
                    my $FONT_ATLAS_1024 = "/font_1024.png";
                    my $image = 'javax::microedition::lcdui::Image'->createImage('org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceAsStream($FONT_ATLAS_1024));
                    $image->setName($canvasStrings->{FONT_ATLAS});
                    $self->{fontImage} = $self->{preResourceImageUtil}->encapsulate($image);
                } elsif ($openGLCapabilities->isTextureSizeValid(512)) {
                    my $FONT_ATLAS_512 = "/font_512.png";
                    my $image = 'javax::microedition::lcdui::Image'->createImage('org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceAsStream($FONT_ATLAS_512));
                    $image->setName($canvasStrings->{FONT_ATLAS});
                    $self->{fontImage} = $self->{preResourceImageUtil}->encapsulate($image);
                } else {
                    my $FONT_ATLAS_512 = "/font_512.png";
                    my $image = 'javax::microedition::lcdui::Image'->createImage('org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceAsStream($FONT_ATLAS_512));
                    $image->setName($canvasStrings->{FONT_ATLAS});
                    $self->{fontImage} = $self->{preResourceImageUtil}->encapsulate($image);
                }
                return $self->{fontImage};
            } else {
                return $self->{fontImage};
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, $commonStrings->{EXCEPTION}, $e);
            die ("RuntimeException");
        }
}


sub saveFontAtlasAsFile {
    my ($self) = @_;
        my $image = $self->getFontBitmap(undef, $self->{cellSize}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        my $imageLoader = 'org::eclipse::swt::graphics::ImageLoader'->new();
        my $imageData = ($image)->{image}->getImageData();
        $imageData->{transparentPixel} = $imageData->getPixel(0, 0);
        $imageLoader->{data} = [$imageData];
        $imageLoader->save('org::allbinary::string::CommonSeps'->getInstance()->{PERIOD} + 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{FONT_ATLAS}, $org::eclipse::swt::SWT::IMAGE_PNG);
}


sub getFontBitmap {
    my ($self, $filename, $cellSize, $basicColor) = @_;
        my $cellsPerRow2 = $self->{CELLS_PER_ROW} * 2;
        my $cellsPerRow3 = $self->{CELLS_PER_ROW} * 3;
        my $cellsPerRow4 = $self->{CELLS_PER_ROW} * 4;
        my $cellsPerRow5 = $self->{CELLS_PER_ROW} * 5;
        my $cellsPerRow6 = $self->{CELLS_PER_ROW} * 6;
        my $cellsPerRow7 = $self->{CELLS_PER_ROW} * 7;
        my $image = 'javax::microedition::lcdui::Image'->createImage($self->{textureSize}, $self->{textureSize});
        my $graphics = $image->getGraphics();
        $graphics->setColor(int($basicColor));
        my $biggestHeight = 0;
        my $bounds = 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->createXY(0, 0), $cellSize, $cellSize);
        my $x = 0;
        my $y = 0;
        for (my $index = 0; $index < $self->{size}; $index++) {
            $self->{characterArray}->[0] = $self->{pattern}->charAt($index);
            $self->{_characterWidth}->[$index] = $bounds->getMaxX();
            if ($bounds->getMaxY() - $bounds->getPoint()->getX() > $biggestHeight) {
                $biggestHeight = $bounds->getMaxY() - $bounds->getPoint()->getX();
            }
            $x = ($index % $self->{CELLS_PER_ROW}) * $cellSize;
            $x += (POSIX::floor(($cellSize) / (2 ** (1))));
            $x -= (POSIX::floor(($self->{_characterWidth}->[$index]) / (2 ** (1))));
            $y = -(POSIX::floor(($cellSize) / (2 ** (1))));
            if ($index >= $self->{CELLS_PER_ROW}) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow2) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow3) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow4) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow5) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow6) {
                $y += $cellSize;
            }
            if ($index >= $cellsPerRow7) {
                $y += $cellSize;
            }
            $y += $cellSize;
            $y -= (POSIX::floor(($cellSize) / (2 ** (2))));
            $graphics->drawChar($self->{characterArray}->[0], $x, $y, 0);
        }
        return $image;
}


sub getFontWidths {
    my ($self, $filename, $fontSize) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        for (my $index = 0; $index < $self->{size}; $index++) {
            $self->{characterArray}->[0] = $self->{pattern}->charAt($index);
            if ($self->{characterArray}->[0] eq " ") {
                $self->{_characterWidth}->[$index] = (int($fontSize / 4));
            } else {
                my $shortPatternIndex = $self->{shortPattern}->indexOf($self->{characterArray}->[0]);
                my $w = int(($self->{widthFloatArray}->[$shortPatternIndex] / 75.0)) + 19;
                $self->{_characterWidth}->[$index] = $w;
                if ($self->{characterArray}->[0] eq "." || $self->{characterArray}->[0] eq "1") {
                    $self->{_characterWidth}->[$index] += 4;
                }
                if ($self->{characterArray}->[0] ge "a" && $self->{characterArray}->[0] lt "k") {
                    $self->{_characterWidth}->[$index] -= 2;
                }
                if ($self->{characterArray}->[0] ge "k" && $self->{characterArray}->[0] lt "v") {
                    $self->{_characterWidth}->[$index] -= 4;
                }
                if ($self->{characterArray}->[0] ge "v" && $self->{characterArray}->[0] lt "z") {
                    $self->{_characterWidth}->[$index] -= 8;
                }
                if ($self->{characterArray}->[0] eq "D") {
                    $self->{_characterWidth}->[$index] -= 4;
                }
                if ($self->{characterArray}->[0] ge "A" && $self->{characterArray}->[0] le "Z") {
                    $self->{_characterWidth}->[$index] -= 2;
                }
            }
            $self->{_characterWidth}->[$index] *= $self->{widthScale};
        }
        return $self->{_characterWidth};
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::eclipse::swt::SWT;
use org::eclipse::swt::graphics::ImageData;
use org::eclipse::swt::graphics::ImageLoader;
use org::microemu::device::swt::SwtMutableImage;
use org::allbinary::AvianUtil;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::opengles::OpenGLCapabilities;
use org::allbinary::image::PreResourceImageUtil;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::emulator::device::TrueTypeFontUtilBase;

1;

