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

package org::allbinary::media::image::SpriteSplitterUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::SpriteSplitterUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ANIMATIONS_LABELS} = ["Row Total:", "Column Total:", "Column Total:", "Row Total:", "Column Total:", "Row Total:"];
    $self->{DIRECTIONAL_ANIMATIONS} = "Directional DLRU";
    $self->{HORIZONTAL_ANIMATIONS} = "Horizontal Animations";
    $self->{HORIZONTAL_SPRITE} = "Horizontal A=R=Y F=C=X";
    $self->{ROW_NAME} = ["idle", "walk", "attack", "defeat"];
    $self->{_ROW} = "_row";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::SpriteSplitterUtil::instance;
}


# throws Exception
sub process {
    my ($self, $imageProcessorInput, $totalFrames, $totalAnimations, $widthReduction, $heightReduction, $increaseWidth, $increaseHeight, $spriteType, $visitor) = @_;
        my $bufferedImage = undef;
        my $generatedBufferedImageArray = undef;
        my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
        for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            $self->{logUtil}->putF($spriteType, $self, $self->{commonStrings}->{RUN});
            if ($spriteType eq $self->{HORIZONTAL_SPRITE}) {
                my $cellHeight = $bufferedImage->getHeight() / $totalAnimations;
                my $cellWidth = $bufferedImage->getWidth() / $totalFrames;
                my $columns = $totalFrames;
                my $rows = $totalAnimations;
                $generatedBufferedImageArray = [map { [(undef) x ($columns)] } 1 .. ($rows)];
                $self->{logUtil}->putF("Processing Individual Cells columns: " . $columns . " rows: " . $rows, $self, $self->{commonStrings}->{RUN});
                $self->{logUtil}->putF("Processing Individual Cells cellHeight: " . $cellHeight . " cellWidth: " . $cellWidth, $self, $self->{commonStrings}->{RUN});
                my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
                my $nameEnding = undef;
                my $x = 0;
                my $y = 0;
                for (my $index2 = 0; $index2 < $rows; $index2++) {
                    $y = $cellHeight * $index2;
                    for (my $index3 = 0; $index3 < $columns; $index3++) {
                        $x = $cellWidth * $index3;
                        $generatedBufferedImageArray->[$index2]->[$index3] = $bufferedImage->getSubimage($x + $widthReduction, $y + $heightReduction, $cellWidth - ($widthReduction * 2), $cellHeight - ($heightReduction * 2));
                        if ($increaseWidth != 0 || $increaseHeight != 0) {
                            $generatedBufferedImageArray->[$index2]->[$index3] = $imageUtil->createBufferedImageAllowTranslate($generatedBufferedImageArray->[$index2]->[$index3], $cellWidth + $increaseWidth, $cellHeight + $increaseHeight, 0, 1);
                        }
                        $nameEnding = 'org::allbinary::logic::string::StringMaker'->new()->appendint($index2)->append($self->{commonSeps}->{UNDERSCORE})->appendint($index3)->toString();
                        $visitor->visit($generatedBufferedImageArray->[$index2]->[$index3], $nameEnding, $index);
                    }
                }
                $self->{logUtil}->putF("Processing Rows from Cells", $self, $self->{commonStrings}->{RUN});
                my $imageUnifierProperties = 'org::allbinary::media::image::ImageUnifierProperties'->new();
                $imageUnifierProperties->setRows(("" . (1)));
                $imageUnifierProperties->setColumns(("" . ($columns)));
                my $imageUnifierCell = 'org::allbinary::media::image::ImageUnifierCell'->new(("" . ($cellWidth - (2 * $widthReduction))), ("" . ($cellHeight - (2 * $heightReduction))));
                $imageUnifierProperties->setImageUnifierCell($imageUnifierCell);
                for (my $index2 = 0; $index2 < $rows; $index2++) {
                    $y = $cellHeight * $index2;
                    my $tempBufferedImageArray = [(undef) x ($columns)];
                    for (my $index3 = 0; $index3 < $columns; $index3++) {
                        $tempBufferedImageArray->[$index3] = $generatedBufferedImageArray->[$index2]->[$index3];
                        $nameEnding = 'org::allbinary::logic::string::StringMaker'->new()->appendint($index2)->append($self->{commonSeps}->{UNDERSCORE})->appendint(1)->append($self->{_ROW})->toString();
                    }
                    my $generatedBufferedImage = 'org::allbinary::media::image::ImageUnifierUtil'->getInstance()->getImage($tempBufferedImageArray, $imageUnifierProperties);
                    $visitor->visit($generatedBufferedImage, $nameEnding, $index);
                }
            } elsif ($spriteType eq $self->{HORIZONTAL_ANIMATIONS}) {
            } elsif ($spriteType eq $self->{DIRECTIONAL_ANIMATIONS}) {
                my $totalFrames2 = 4;
                my $cellHeight = $bufferedImage->getHeight() / $totalFrames2;
                my $cellWidth = $bufferedImage->getWidth() / $totalAnimations;
                my $columns = $totalAnimations;
                my $rows = $totalFrames2;
                $generatedBufferedImageArray = [map { [(undef) x ($columns)] } 1 .. ($rows)];
                $self->{logUtil}->putF("Processing Individual Cells for each Direction", $self, $self->{commonStrings}->{RUN});
                my $nameEnding = undef;
                my $x = 0;
                my $y = 0;
                for (my $index2 = 0; $index2 < $rows; $index2++) {
                    $y = $cellHeight * $index2;
                    for (my $index3 = 0; $index3 < $columns; $index3++) {
                        $x = $cellWidth * $index3;
                        $generatedBufferedImageArray->[$index2]->[$index3] = $bufferedImage->getSubimage($x + $widthReduction, $y + $heightReduction, $cellWidth - ($widthReduction * 2), $cellHeight - ($heightReduction * 2));
                        if ($increaseWidth != 0 || $increaseHeight != 0) {
                            $generatedBufferedImageArray->[$index2]->[$index3] = 'org::allbinary::media::image::ImageUtil'->getInstance()->createBufferedImageAllowTranslate($generatedBufferedImageArray->[$index2]->[$index3], $cellWidth + $increaseWidth, $cellHeight + $increaseHeight, 0, 1);
                        }
                        $nameEnding = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{DIRECTION_NAME}->[$index2])->append($self->{commonSeps}->{UNDERSCORE})->appendint($index3)->toString();
                        $visitor->visit($generatedBufferedImageArray->[$index2]->[$index3], $nameEnding, $index);
                    }
                }
                my $imageUnifierProperties = 'org::allbinary::media::image::ImageUnifierProperties'->new();
                $imageUnifierProperties->setRows(("" . (1)));
                $imageUnifierProperties->setColumns(("" . ($columns)));
                my $imageUnifierCell = 'org::allbinary::media::image::ImageUnifierCell'->new(("" . ($cellWidth - (2 * $widthReduction))) + $increaseWidth, ("" . ($cellHeight - (2 * $heightReduction) + $increaseHeight)));
                $imageUnifierProperties->setImageUnifierCell($imageUnifierCell);
                $self->{logUtil}->putF("Processing Rows from Cells for each Direction", $self, $self->{commonStrings}->{RUN});
                for (my $index2 = 0; $index2 < $rows; $index2++) {
                    $y = $cellHeight * $index2;
                    my $tempBufferedImageArray = [(undef) x ($columns)];
                    for (my $index3 = 0; $index3 < $columns; $index3++) {
                        $tempBufferedImageArray->[$index3] = $generatedBufferedImageArray->[$index2]->[$index3];
                        $nameEnding = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{DIRECTION_NAME}->[$index2])->append($self->{commonSeps}->{UNDERSCORE})->appendint(1)->append($self->{_ROW})->toString();
                    }
                    my $generatedBufferedImage = 'org::allbinary::media::image::ImageUnifierUtil'->getInstance()->getImage($tempBufferedImageArray, $imageUnifierProperties);
                    $visitor->visit($generatedBufferedImage, $nameEnding, $index);
                }
            }
        }
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::ImageUnifierProperties;
use org::allbinary::media::image::ImageUnifierCell;
use org::allbinary::media::image::ImageUnifierUtil;

1;

