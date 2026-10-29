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

package org::allbinary::image::gui::CreateIconImagesJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::media::image::ImageProcessorInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageProcessorInput} = undef;
    $self->{aboveJButton} = undef;
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->{imageProcessorInput} = $imageProcessorInput;
        my $numberStringArray = [(undef) x (101)];
        $numberStringArray->[0] = ("" . (-1));
        for (my $index = 1; $index < 100; $index++) {
            $numberStringArray->[$index] = ("" . ($index));
        }
        my $araster = $self->{imageProcessorInput}->getBufferedImageArray()->[0]->getAlphaRaster();
        if (!defined($araster)) {
            print("there is no Alpha channel!!!!!!!!!", "\n");
        } else {
            print("Alpha channel found !", "\n");
        }
    return $self;
}


sub process {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN66679 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
                    my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $files = $imageProcessorInput->getFiles();
                    my $iconWidthList = 'org::allbinary::util::BasicArrayListD'->new();
                    my $iconHeightList = 'org::allbinary::util::BasicArrayListD'->new();
                    $iconWidthList->add(864);
                    $iconHeightList->add(864);
                    my $ANDROID = "android-icon-";
                    my $IOS = "ios-icon-";
                    my $size = $iconWidthList->size();
                    my $width = 0;
                    my $height = 0;
                    for (my $index2 = 0; $index2 < $size; $index2++) {
                        $width = int(($iconWidthList->get($index2)));
                        $height = int(($iconHeightList->get($index2)));
                        my $generatedBufferedImageArray = $imageUtil->createBufferedImage3($imageProcessorInput->getBufferedImageArray(), $width, $height, 1);
                        my $imagePersistanceUtil = 'org::allbinary::media::image::ImagePersistanceUtil'->getInstance();
                        for (my $index = 0; $index < scalar(@{$generatedBufferedImageArray}); $index++) {
                            my $filePath = $files->[$index]->getAbsolutePath();
                            my $endIndex = rindex($filePath, "\\");
                            my $path = substr($filePath, 0, ($endIndex + 1) - (0));
                            $stringMaker->delete(0, $stringMaker->length());
                            $stringMaker->append($path)->append($ANDROID)->appendint($width)->append('org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{_PNG});
                            my $newFilePath = $stringMaker->toString();
                            $imagePersistanceUtil->saveWithBatik('org::allbinary::logic::io::file::AbFile'->createAbFile($newFilePath), $generatedBufferedImageArray->[$index]);
                            $stringMaker->delete(0, $stringMaker->length());
                            $stringMaker->append($path)->append($IOS)->appendint($width)->append('org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{_PNG});
                            $newFilePath = $stringMaker->toString();
                            $imagePersistanceUtil->saveWithBatik('org::allbinary::logic::io::file::AbFile'->createAbFile($newFilePath), $generatedBufferedImageArray->[$index]);
                        }
                    }
                    $self->getParent()->repaint();
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66679'->can('new') ? 'java::lang::Thread::AnonymousN66679'->new() : bless({}, 'java::lang::Thread::AnonymousN66679')
        }->start();
}


sub getImageProcessorInput {
    my ($self) = @_;
        return $self->{imageProcessorInput};
}


sub setImageProcessorInput {
    my ($self, $imageProcessorInput) = @_;
        $self->{imageProcessorInput} = $imageProcessorInput;
}


sub initComponents {
    my ($self) = @_;
        $self->{aboveJButton} = 'javax::swing::JButton'->new();
        $self->{aboveJButton}->setText("Process");
        $self->{aboveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68821 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->aboveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68821'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68821'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68821')
        });
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{aboveJButton})->addGap(0, 335, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addComponent($self->{aboveJButton})->addContainerGap(286, 32767)));
}


sub aboveJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}

# use java::awt::image::BufferedImage;
# use java::awt::image::Raster;
use java::io::File;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::ImagePersistanceUtil;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use java::lang::System;
use java::lang::Thread;

1;

