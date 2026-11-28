# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::opengles::shader::ShaderComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{disableProgramShaderOpenGLProcessor} = undef unless exists $self->{disableProgramShaderOpenGLProcessor};
    $self->{requiresOpenGLVersion} = undef unless exists $self->{requiresOpenGLVersion};
    $self->{shaderArray} = undef unless exists $self->{shaderArray};
    $self->{shaderInitializer} = undef unless exists $self->{shaderInitializer};
    $self->{compositeShaderUpdater} = undef unless exists $self->{compositeShaderUpdater};
    $self->{modelViewProjection} = undef unless exists $self->{modelViewProjection};
    $self->{colorOpenGLProcessor} = undef unless exists $self->{colorOpenGLProcessor};
    $self->{vertexOpenGLProcessor} = undef unless exists $self->{vertexOpenGLProcessor};
    $self->{useProgramShaderOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{shaderMatrixOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{colorEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{normalEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{vertexEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{textureEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{colorDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{normalDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{vertexDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{textureDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{uniformLightPositionOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformLightColorOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformCameraPositionOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformTextureUnitOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{programHandle} = 0 unless exists $self->{programHandle};
}


sub new {
    my ($class, $requiresOpenGLVersion, $shaderArray, $compositeShaderUpdater, $shaderInitializer, $modelViewProjection, $colorOpenGLProcessor, $vertexOpenGLProcessor, $disableProgramShaderOpenGLProcessor) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{requiresOpenGLVersion} = $requiresOpenGLVersion;
        $self->{shaderArray} = $shaderArray;
        $self->{shaderInitializer} = $shaderInitializer;
        $self->{compositeShaderUpdater} = $compositeShaderUpdater;
        $self->{modelViewProjection} = $modelViewProjection;
        $self->{colorOpenGLProcessor} = $colorOpenGLProcessor;
        $self->{vertexOpenGLProcessor} = $vertexOpenGLProcessor;
        $self->{disableProgramShaderOpenGLProcessor} = $disableProgramShaderOpenGLProcessor;
    return $self;
}


sub init {
    my ($self, $gl) = @_;
        $self->{programHandle} = $self->{shaderInitializer}->init($gl, $self->{shaderArray}, $self->{compositeShaderUpdater}->{attributeArray});
}

use java::lang::Object ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::graphics::opengles::OpenGLProcessor ();
use org::allbinary::graphics::opengles::NullOpenGLProcessorFactory ();
use org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor ();

1;

