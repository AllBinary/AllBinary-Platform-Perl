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
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{preResourceImageUtil} = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
    $self->{realFontSize} = 18;
    $self->{fontImage} = $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::device::TrueTypeFontUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(1);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub saveFontAtlasAsFile {
    my ($self) = @_;
        try {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            my $file = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext()->getFilesDir();
            my $path = $file->getAbsolutePath() + 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{FONT_ATLAS};
            $self->{logUtil}->putF($path, $self, $commonStrings->{CONSTRUCTOR});
            my $fos = 'java::io::FileOutputStream'->new($path);
            my $bitmap = ($self->{fontImage}->{openGLBitmap}->getImage())->getBitmap();
            $bitmap->compress($android::graphics::Bitmap::CompressFormat->{PNG}, 100, $fos);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, $commonStrings->{EXCEPTION}, $e);
        }
}


sub getFontBitmapGL {
    my ($self, $gl, $filename, $cellSize, $basicColor) = @_;
        if ($self->{fontImage} == $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE) {
            my $cellsPerRow2 = $self->{CELLS_PER_ROW} * 2;
            my $cellsPerRow3 = $self->{CELLS_PER_ROW} * 3;
            my $cellsPerRow4 = $self->{CELLS_PER_ROW} * 4;
            my $cellsPerRow5 = $self->{CELLS_PER_ROW} * 5;
            my $cellsPerRow6 = $self->{CELLS_PER_ROW} * 6;
            my $cellsPerRow7 = $self->{CELLS_PER_ROW} * 7;
            my $typeface = $android::graphics::Typeface::DEFAULT;
            my $textureSize = $self->getAsTextureSize($self->{CELLS_PER_ROW} * $cellSize);
            my $bitmap = 'android::graphics::Bitmap'->createBitmap($textureSize, $textureSize, $android::graphics::Bitmap::Config->{ARGB_8888});
            my $canvas = 'android::graphics::Canvas'->new($bitmap);
            my $paint = 'android::graphics::Paint'->new();
            $paint->setTypeface($typeface);
            $paint->setTextSize($self->{realFontSize});
            $paint->setAlpha(int($basicColor->{alpha}));
            $paint->setColor(int($basicColor));
            my $biggestHeight = 0;
            my $bounds = 'android::graphics::Rect'->new();
            my $x = 0;
            my $y = 0;
            for (my $index = 0; $index < $self->{size}; $index++) {
                $self->{characterArray}->[0] = $self->{pattern}->charAt($index);
                $paint->getTextBounds($self->{characterArray}, 0, 1, $bounds);
                $self->{_characterWidth}->[$index] = $bounds->{right};
                if ($bounds->{bottom} - $bounds->{top} > $biggestHeight) {
                    $biggestHeight = $bounds->{bottom} - $bounds->{top};
                }
                $x = ($index % $self->{CELLS_PER_ROW}) * $cellSize;
                $x += (POSIX::floor(($cellSize) / (2 ** (1))));
                $x -= (POSIX::floor(($self->{_characterWidth}->[$index]) / (2 ** (1))));
                $y = 0;
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
                $canvas->drawText($self->{characterArray}, 0, 1, $x - 3.0, $y - 6.0, $paint);
            }
            $canvas->save();
            my $image = 'org::microemu::android::device::AndroidImmutableImage'->create($bitmap);
            $self->{fontImage} = $self->{preResourceImageUtil}->encapsulate($image);
            return $self->{fontImage};
        } else {
            return $self->{fontImage};
        }
}


sub getFontWidths {
    my ($self, $filename, $fontSize) = @_;
        my $typeface = $android::graphics::Typeface::DEFAULT;
        my $paint = 'android::graphics::Paint'->new();
        $paint->setTypeface($typeface);
        $paint->setTextSize($fontSize);
        $paint->setARGB(255, 255, 255, 255);
        my $bounds = 'android::graphics::Rect'->new();
        for (my $index = 0; $index < $self->{size}; $index++) {
            $self->{characterArray}->[0] = $self->{pattern}->charAt($index);
            $paint->getTextBounds($self->{characterArray}, 0, 1, $bounds);
            if ($index < $self->{lastCapIndex}) {
                if ($self->{characterArray}->[0] eq "1") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 3;
                } elsif ($self->{characterArray}->[0] eq "J" || $self->{characterArray}->[0] eq "V" || $self->{characterArray}->[0] eq "2" || $self->{characterArray}->[0] eq "9" || $self->{characterArray}->[0] eq "I" || $self->{characterArray}->[0] eq "N" || $self->{characterArray}->[0] eq "U") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 1;
                } elsif ($self->{characterArray}->[0] eq "4" || $self->{characterArray}->[0] eq "C" || $self->{characterArray}->[0] eq "E" || $self->{characterArray}->[0] eq "O") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 2;
                } elsif ($self->{characterArray}->[0] eq "B" || $self->{characterArray}->[0] eq "D" || $self->{characterArray}->[0] eq "G" || $self->{characterArray}->[0] eq "H" || $self->{characterArray}->[0] eq "T" || $self->{characterArray}->[0] eq "W") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 3;
                } elsif ($self->{characterArray}->[0] eq "A" || $self->{characterArray}->[0] eq "Q" || $self->{characterArray}->[0] eq "R") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 5;
                } elsif ($self->{characterArray}->[0] eq "M") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 6;
                } elsif ($self->{characterArray}->[0] eq "m") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 8;
                } else {
                    $self->{_characterWidth}->[$index] = $bounds->{right};
                }
            } else {
                if ($self->{characterArray}->[0] eq " ") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 10;
                } elsif ($self->{characterArray}->[0] eq "l" || $self->{characterArray}->[0] eq "i" || $self->{characterArray}->[0] eq "j" || $self->{characterArray}->[0] eq "." || $self->{characterArray}->[0] eq "!" || $self->{characterArray}->[0] eq "|") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 6;
                } elsif ($self->{characterArray}->[0] eq "f" || $self->{characterArray}->[0] eq "t" || $self->{characterArray}->[0] eq "u" || $self->{characterArray}->[0] eq "v") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 1;
                } elsif ($self->{characterArray}->[0] eq "r") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} + 2;
                } elsif ($self->{characterArray}->[0] eq "a" || $self->{characterArray}->[0] eq "b" || $self->{characterArray}->[0] eq "g" || $self->{characterArray}->[0] eq "u") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 1;
                } elsif ($self->{characterArray}->[0] eq "o" || $self->{characterArray}->[0] eq "e") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 2;
                } elsif ($self->{characterArray}->[0] eq "m") {
                    $self->{_characterWidth}->[$index] = $bounds->{right} - 7;
                } else {
                    $self->{_characterWidth}->[$index] = $bounds->{right};
                }
            }
        }
        $self->{_characterWidth}->[0] = (POSIX::floor(($fontSize) / (2 ** (1)))) - 2;
        return $self->{_characterWidth};
}

use java::io::File;
# use java::io::FileOutputStream;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use android::graphics::Bitmap;
use android::graphics::Canvas;
use android::graphics::Paint;
use android::graphics::Rect;
use android::graphics::Typeface;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::image::PreResourceImageUtil;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::microemu::android::device::AndroidImageInterface;
use org::microemu::android::device::AndroidImmutableImage;
use org::allbinary::emulator::device::TrueTypeFontUtilBase;

1;

