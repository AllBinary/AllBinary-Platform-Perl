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

package org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::RunnableInterface';

our $FILE = "file:";
our $JAR_DIR_PROP = "org.knopflerfish.gosg.jars";
our $INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH = "ia/auto";
our $MODULES_START_LEVEL = 8;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputAutomationBundleActivator} = undef;
    $self->{running} = 0;
    $self->{fileBasicArrayList} = undef;
}


sub new {
    my ($class, $inputAutomationBundleActivator) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{inputAutomationBundleActivator} = $inputAutomationBundleActivator;
        $self->{fileBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


# throws Exception
sub setThread {
    my ($self, $thread) = @_;
}


sub isRunning {
    my ($self) = @_;
        return $self->{running};
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{running} = $running;
}


# throws Exception
sub updateModules {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "updateModules");
        my $list = $self->findNewModules();
        my $size = $list->size();
        my $bundle = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bundle = $self->install($list->get($index));
            if (defined($bundle)) {
                $bundle->start($org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable::MODULES_START_LEVEL);
            }
        }
}


# throws Exception
sub getAllJarSymbolicNameHashMap {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getAllJarSymbolicNameHashMap");
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $jarFileBasicArrayList = $self->getJarModuleFileBasicArrayList();
        $self->{logUtil}->putF("Jar Module Files: " . $jarFileBasicArrayList, $self, "getAllJarSymbolicNameHashMap");
        my $size = $jarFileBasicArrayList->size();
        my $file = undef;
        for (my $index = 0; $index < $size; $index++) {
            $file = $jarFileBasicArrayList->get($index);
            if (!$file->isDirectory()) {
                my $fileInputStream = 'java::io::FileInputStream'->new($file);
                my $jarInputStream = 'java::util::jar::JarInputStream'->new($fileInputStream);
                my $manifest = $jarInputStream->getManifest();
                if (!defined($manifest)) {
                } else {
                    my $symbolicName = $manifest->getMainAttributes()->getValue($org::osgi::framework::Constants::BUNDLE_SYMBOLICNAME);
                    if (defined($symbolicName)) {
                        $hashMap->put($symbolicName, 'java::net::URL'->new($org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable::FILE + $file->getAbsolutePath()));
                    }
                }
            }
        }
        return $hashMap;
}


sub getJarModuleFileBasicArrayList {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getJarModuleFileBasicArrayList");
        my $baseJarPath = 'java::lang::System'->getProperty($JAR_DIR_PROP);
        if ((index($baseJarPath, $org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable::FILE) == 0)) {
            $baseJarPath = substr($baseJarPath, $org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable::FILE->length());
        }
        my $jarFileFilter = 'org::allbinary::logic::io::file::filter::BasicFileFilterUtil'->getInstance(".jar");
        my $path = $baseJarPath . $org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable::INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH;
        $self->{logUtil}->putF("Path: " . $path, $self, "getJarModuleFileBasicArrayList");
        my $file = 'java::io::File'->new($path);
        $self->{logUtil}->putF("File: " . $file->getAbsolutePath() . " isDirectory: " . $file->isDirectory(), $self, "getJarModuleFileBasicArrayList");
        return 'org::allbinary::logic::io::file::directory::SubDirectory'->getInstance()->search($jarFileFilter, 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFile($file));
}


# throws Exception
sub getInstalledJarSymbolicNameBasicArrayList {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstalledJarSymbolicNameBasicArrayList");
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $bundleContext = 'bundle::input::automation::InputAutomationBundleActivator'->getBundleContext();
        my $bundleArray = $bundleContext->getBundles();
        if (defined($bundleArray)) {
            $self->{logUtil}->putF("bundleArray: " . scalar(@{$bundleArray}), $self, "getInputAutomationModuleServices");
            for (my $index = 0; $index < scalar(@{$bundleArray}); $index++) {
                my $bundle = $bundleArray->[$index];
                $vector->add($bundle->getSymbolicName());
            }
        }
        return $vector;
}


# throws Exception
sub isInstalled {
    my ($self, $symbolicName) = @_;
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $symbolicName, $self, "isInstalled");
        my $list = $self->getInstalledJarSymbolicNameBasicArrayList();
        my $size = $list->size();
        my $nextSymbolicName = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextSymbolicName = $list->get($index);
            if (($nextSymbolicName cmp $symbolicName) == 0) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub findNewModules {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "findNewModules");
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $hashMap = $self->getAllJarSymbolicNameHashMap();
        $self->{logUtil}->putF("All: " . $hashMap, $self, "findNewModules");
        my $set = $hashMap->keySet();
        my $symbolicNameArray = $set->toArray();
        my $size = scalar(@{$symbolicNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $symbolicName = $symbolicNameArray->[$index];
            if (!$self->isInstalled($symbolicName)) {
                $vector->add($hashMap->get($symbolicName));
            }
        }
        return $vector;
}


# throws Exception
sub install {
    my ($self, $url) = @_;
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} + $url, $self, "install");
        my $bundleContext = 'bundle::input::automation::InputAutomationBundleActivator'->getBundleContext();
        return $bundleContext->installBundle($url->toString());
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{RUN});
            $self->setRunning(1);
            my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new(1000);
            while ($self->isRunning()) {
                $timeHelper->setStartTimeTNT();
                $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{ELAPSED} + $timeHelper->getElapsedTNT(), $self, $self->{commonStrings}->{RUN});
                $self->updateModules();
                last;
            }
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}

use java::io::File;
# use java::io::FileFilter;
# use java::io::FileInputStream;
# use java::net::URL;
use java::util::HashMap;
# use java::util::Set;
# use java::util::jar::JarInputStream;
# use java::util::jar::Manifest;
use org::osgi::framework::Bundle;
use org::osgi::framework::BundleContext;
use org::osgi::framework::Constants;
use bundle::input::automation::InputAutomationBundleActivator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::logic::io::file::directory::SubDirectory;
use org::allbinary::logic::io::file::filter::BasicFileFilterUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use java::lang::System;

1;

