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

package org::allbinary::image::gui::ImageAnalysisResultsJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{avgBlueJTextField} = undef;
    $self->{avgGreenJTextField} = undef;
    $self->{avgRedJTextField} = undef;
    $self->{jComboBox1} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel10} = undef;
    $self->{jLabel11} = undef;
    $self->{jLabel12} = undef;
    $self->{jLabel13} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jLabel4} = undef;
    $self->{jLabel5} = undef;
    $self->{jLabel6} = undef;
    $self->{jLabel7} = undef;
    $self->{jLabel8} = undef;
    $self->{jLabel9} = undef;
    $self->{matchingPixelsJTextField} = undef;
    $self->{maxBlueJTextField} = undef;
    $self->{maxGreenJTextField} = undef;
    $self->{maxRedJTextField} = undef;
    $self->{minBlueJTextField} = undef;
    $self->{minGreenJTextField} = undef;
    $self->{minRedJTextField} = undef;
    $self->{percentMatchingJTextField} = undef;
    $self->{totalPixelsJTextField} = undef;
}


sub new {
    my ($class, $imageAnalysisResultsArray) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
        my $imageAnalysisResults = $imageAnalysisResultsArray->[0];
        $self->updateImageColorRangeResults($imageAnalysisResults);
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{percentMatchingJTextField} = 'javax::swing::JTextField'->new();
        $self->{totalPixelsJTextField} = 'javax::swing::JTextField'->new();
        $self->{matchingPixelsJTextField} = 'javax::swing::JTextField'->new();
        $self->{jComboBox1} = 'javax::swing::JComboBox'->new();
        $self->{jLabel4} = 'javax::swing::JLabel'->new();
        $self->{jLabel5} = 'javax::swing::JLabel'->new();
        $self->{jLabel6} = 'javax::swing::JLabel'->new();
        $self->{jLabel7} = 'javax::swing::JLabel'->new();
        $self->{avgRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{avgGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{avgBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{minGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel8} = 'javax::swing::JLabel'->new();
        $self->{jLabel9} = 'javax::swing::JLabel'->new();
        $self->{jLabel10} = 'javax::swing::JLabel'->new();
        $self->{minRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{minBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel11} = 'javax::swing::JLabel'->new();
        $self->{jLabel12} = 'javax::swing::JLabel'->new();
        $self->{jLabel13} = 'javax::swing::JLabel'->new();
        $self->{maxRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel1}->setText("Matching Pixels:");
        $self->{jLabel2}->setText("Total Pixels:");
        $self->{jLabel3}->setText("Percent Matching:");
        $self->{percentMatchingJTextField}->setEditable(0);
        $self->{totalPixelsJTextField}->setEditable(0);
        $self->{matchingPixelsJTextField}->setEditable(0);
        $self->{jComboBox1}->setModel('javax::swing::DefaultComboBoxModel'->new(['org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE}]));
        $self->{jComboBox1}->setEnabled(0);
        $self->{jLabel4}->setText("Image:");
        $self->{jLabel5}->setText("Average Red:");
        $self->{jLabel6}->setText("Average Green:");
        $self->{jLabel7}->setText("Average Blue:");
        $self->{avgRedJTextField}->setEditable(0);
        $self->{avgGreenJTextField}->setEditable(0);
        $self->{avgBlueJTextField}->setEditable(0);
        $self->{minGreenJTextField}->setEditable(0);
        $self->{jLabel8}->setText("Min Red:");
        $self->{jLabel9}->setText("Min Green:");
        $self->{jLabel10}->setText("Min Blue:");
        $self->{minRedJTextField}->setEditable(0);
        $self->{minBlueJTextField}->setEditable(0);
        $self->{jLabel11}->setText("Max Red:");
        $self->{jLabel12}->setText("Max Green:");
        $self->{jLabel13}->setText("Max Blue:");
        $self->{maxRedJTextField}->setEditable(0);
        $self->{maxGreenJTextField}->setEditable(0);
        $self->{maxBlueJTextField}->setEditable(0);
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jLabel3})->addComponent($self->{jLabel2})->addComponent($self->{jLabel1})->addComponent($self->{jLabel5})->addComponent($self->{jLabel6})->addComponent($self->{jLabel7})->addComponent($self->{jLabel4}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jComboBox1}, $javax::swing::GroupLayout::PREFERRED_SIZE, 81, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{avgBlueJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767)->addComponent($self->{avgGreenJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767)->addComponent($self->{avgRedJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767)->addComponent($self->{totalPixelsJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767)->addComponent($self->{percentMatchingJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767)->addComponent($self->{matchingPixelsJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 81, 32767))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jLabel12})->addComponent($self->{jLabel13})->addComponent($self->{jLabel8})->addComponent($self->{jLabel9})->addComponent($self->{jLabel10})->addComponent($self->{jLabel11}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{minRedJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{maxGreenJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{minGreenJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{minBlueJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{maxRedJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{maxBlueJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 82, $javax::swing::GroupLayout::PREFERRED_SIZE))->addContainerGap(18, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel4})->addComponent($self->{jComboBox1}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{matchingPixelsJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel8})->addComponent($self->{minRedJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel2})->addComponent($self->{totalPixelsJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel9})->addComponent($self->{minGreenJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel3})->addComponent($self->{percentMatchingJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel10})->addComponent($self->{minBlueJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel5})->addComponent($self->{avgRedJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel11})->addComponent($self->{maxRedJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel6})->addComponent($self->{avgGreenJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{maxGreenJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel12}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel7})->addComponent($self->{avgBlueJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel13})->addComponent($self->{maxBlueJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))));
}


sub updateImageColorRangeResults {
    my ($self, $imageAnalysisResults) = @_;
        my $imageColorRangeResults = $imageAnalysisResults->getImageColorRangeResults();
        $self->{matchingPixelsJTextField}->setText($imageColorRangeResults->getMatchingPixelsChecked()->toString());
        $self->{totalPixelsJTextField}->setText($imageColorRangeResults->getTotalPixelsChecked()->toString());
        $self->{percentMatchingJTextField}->setText($imageColorRangeResults->getPercent()->toString());
        my $imageColorResults = $imageAnalysisResults->getImageColorResults();
        $self->{avgRedJTextField}->setText($imageColorResults->getColorAverage()->getAvgRed()->toString());
        $self->{avgGreenJTextField}->setText($imageColorResults->getColorAverage()->getAvgGreen()->toString());
        $self->{avgBlueJTextField}->setText($imageColorResults->getColorAverage()->getAvgBlue()->toString());
        $self->{minRedJTextField}->setText($imageColorResults->getColorRange()->getMinRed()->toString());
        $self->{minGreenJTextField}->setText($imageColorResults->getColorRange()->getMinGreen()->toString());
        $self->{minBlueJTextField}->setText($imageColorResults->getColorRange()->getMinBlue()->toString());
        $self->{maxRedJTextField}->setText($imageColorResults->getColorRange()->getMaxRed()->toString());
        $self->{maxGreenJTextField}->setText($imageColorResults->getColorRange()->getMaxGreen()->toString());
        $self->{maxBlueJTextField}->setText($imageColorResults->getColorRange()->getMaxBlue()->toString());
}

use java::lang::Object ();
use org::allbinary::media::image::analysis::ImageAnalysisResults ();
use org::allbinary::media::image::analysis::ImageColorRangeResults ();
use org::allbinary::media::image::analysis::ImageColorResults ();
use org::allbinary::string::CommonPhoneStrings ();
# use javax::swing::DefaultComboBoxModel ();
# use javax::swing::GroupLayout ();
# use javax::swing::JComboBox ();
# use javax::swing::JLabel ();
# use javax::swing::JPanel ();
# use javax::swing::JTextField ();
# use javax::swing::LayoutStyle ();

1;

