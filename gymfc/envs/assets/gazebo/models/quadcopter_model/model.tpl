<?xml version='1.0'?>
<sdf version='1.6'>

	
  <model name='quadcopter_model'>
	  <enable_wind>true</enable_wind>
	  <!--<pose>0 0 0.194923 0 0 0</pose>-->
    <pose>0 0 0 0 0 0</pose>
    <link name='base_link'>

	  <enable_wind>true</enable_wind>

      <velocity_decay>
        <linear>0.0</linear>
        <angular>0.0</angular>
      </velocity_decay>
      <inertial>
        <pose>0 0 0 0 0 0</pose>
        <mass>1.5</mass>
        <inertia>
          <ixx>0.008</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.015</iyy>
          <iyz>0</iyz>
          <izz>0.017</izz>
        </inertia>
      </inertial>
      <collision name='base_link_collision'>
        <pose>0 0 -0.08 0 0 0</pose>
        <geometry>
          <box>
            <size>0.47 0.47 0.23</size>
          </box>
        </geometry>
        <surface>
          <contact>
            <ode>
              <max_vel>100.0</max_vel>
              <min_depth>0.001</min_depth>
            </ode>
          </contact>
          <friction>
            <ode>
              <mu>1.0</mu>
              <mu2>1.0</mu2>
            </ode>
          </friction>
        </surface>
      </collision>

	  <!-- Main body of the quad -->
      <visual name='base_link_visual'>
        <geometry>
          <mesh>
            <uri>model://quadcopter_model/meshes/iris.dae</uri>
          </mesh>
        </geometry>
        <material>
          <script>
            <name>Gazebo/OrangeTransparent</name>
          </script>
        </material>
      </visual>
    </link>
    <link name='quadcopter_model/ground_truth/odometry_sensorgt_link'>
      <pose>0 0 0 0 -0 0</pose>
      <inertial>
        <pose>0 0 0 0 -0 0</pose>
        <mass>0.15</mass>
        <inertia>
          <ixx>0.0001</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.0002</iyy>
          <iyz>0</iyz>
          <izz>0.0002</izz>
        </inertia>
      </inertial>
    </link>
    <joint name='quadcopter_model/ground_truth/odometry_sensorgt_joint' type='revolute'>
      <child>quadcopter_model/ground_truth/odometry_sensorgt_link</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>0</lower>
          <upper>0</upper>
          <effort>0</effort>
          <velocity>0</velocity>
        </limit>
        <dynamics>
          <damping>1.0</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <link name='quadcopter_model/imu_link'>
      <inertial>
        <pose>0 0 0 0 0 0</pose>
        <mass>0.15</mass>
        <inertia>
          <ixx>0.00001</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.00002</iyy>
          <iyz>0</iyz>
          <izz>0.00002</izz>
        </inertia>
      </inertial>
      <sensor name="imu_sensor" type="imu">
        <pose>0 0 0 3.141593 0 0</pose>
        <always_on>1</always_on>
        <update_rate>1000.0</update_rate>
		<imu>
			<angular_velocity>
				<!-- At runtime these are filled in -->
				<x>
					<noise type="%(noise_type)s">
						<stddev>%(noise_stddev)s</stddev>
					</noise>
				</x>
				<y>
					<noise type="%(noise_type)s">
						<stddev>%(noise_stddev)s</stddev>
					</noise>
				</y>
				<z>
					<noise type="%(noise_type)s">
						<stddev>%(noise_stddev)s</stddev>
					</noise>
				</z>
			</angular_velocity>
		</imu>
      </sensor>
    </link>
    <joint name='quadcopter_model/imu_joint' type='revolute'>
      <child>quadcopter_model/imu_link</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>0</lower>
          <upper>0</upper>
          <effort>0</effort>
          <velocity>0</velocity>
        </limit>
        <dynamics>
          <damping>1.0</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <link name='rotor_0'>
      <pose>0.13 -0.22 0.023 0 -0 0</pose>
      <inertial>
        <pose>0 0 0 0 -0 0</pose>
        <mass>0.025</mass>
        <inertia>
          <ixx>9.75e-06</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.000166704</iyy>
          <iyz>0</iyz>
          <izz>0.000167604</izz>
        </inertia>
      </inertial>
      <collision name='rotor_0_collision'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <cylinder>
            <length>0.005</length>
            <radius>0.1</radius>
          </cylinder>
        </geometry>
        <surface>
          <contact>
            <ode/>
          </contact>
          <friction>
            <ode/>
          </friction>
        </surface>
      </collision>
      <visual name='rotor_0_visual'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <mesh>
            <scale>1 1 1</scale>
            <uri>model://quadcopter_model/meshes/iris_prop_ccw.dae</uri>
          </mesh>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Blue</name>
            <uri>__default__</uri>
          </script>
        </material>
      </visual>
      <gravity>1</gravity>
      <velocity_decay/>
      <self_collide>0</self_collide>
    </link>
    <joint name='rotor_0_joint' type='revolute'>
      <child>rotor_0</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>-1e+16</lower>
          <upper>1e+16</upper>
        </limit>
        <dynamics>
          <damping>0.004</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <link name='rotor_1'>
      <pose>-0.13 0.2 0.023 0 -0 0</pose>
      <inertial>
        <pose>0 0 0 0 -0 0</pose>
        <mass>0.025</mass>
        <inertia>
          <ixx>9.75e-06</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.000166704</iyy>
          <iyz>0</iyz>
          <izz>0.000167604</izz>
        </inertia>
      </inertial>
      <collision name='rotor_1_collision'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <cylinder>
            <length>0.005</length>
            <radius>0.1</radius>
          </cylinder>
        </geometry>
        <surface>
          <contact>
            <ode/>
          </contact>
          <friction>
            <ode/>
          </friction>
        </surface>
      </collision>
      <visual name='rotor_1_visual'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <mesh>
            <scale>1 1 1</scale>
            <uri>model://quadcopter_model/meshes/iris_prop_ccw.dae</uri>
          </mesh>
        </geometry>
        <material>
          <script>
            <name>Gazebo/DarkGrey</name>
            <uri>__default__</uri>
          </script>
        </material>
      </visual>
      <gravity>1</gravity>
      <velocity_decay/>
      <self_collide>0</self_collide>
    </link>
    <joint name='rotor_1_joint' type='revolute'>
      <child>rotor_1</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>-1e+16</lower>
          <upper>1e+16</upper>
        </limit>
        <dynamics>
          <damping>0.004</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <link name='rotor_2'>
      <pose>0.13 0.22 0.023 0 -0 0</pose>
      <inertial>
        <pose>0 0 0 0 -0 0</pose>
        <mass>0.025</mass>
        <inertia>
          <ixx>9.75e-06</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.000166704</iyy>
          <iyz>0</iyz>
          <izz>0.000167604</izz>
        </inertia>
      </inertial>
      <collision name='rotor_2_collision'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <cylinder>
            <length>0.005</length>
            <radius>0.1</radius>
          </cylinder>
        </geometry>
        <surface>
          <contact>
            <ode/>
          </contact>
          <friction>
            <ode/>
          </friction>
        </surface>
      </collision>
      <visual name='rotor_2_visual'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <mesh>
            <scale>1 1 1</scale>
            <uri>model://quadcopter_model/meshes/iris_prop_cw.dae</uri>
          </mesh>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Blue</name>
            <uri>__default__</uri>
          </script>
        </material>
      </visual>
      <gravity>1</gravity>
      <velocity_decay/>
      <self_collide>0</self_collide>
    </link>
    <joint name='rotor_2_joint' type='revolute'>
      <child>rotor_2</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>-1e+16</lower>
          <upper>1e+16</upper>
        </limit>
        <dynamics>
          <damping>0.004</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <link name='rotor_3'>
      <pose>-0.13 -0.2 0.023 0 -0 0</pose>
      <inertial>
        <pose>0 0 0 0 -0 0</pose>
        <mass>0.025</mass>
        <inertia>
          <ixx>9.75e-06</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.000166704</iyy>
          <iyz>0</iyz>
          <izz>0.000167604</izz>
        </inertia>
      </inertial>
      <collision name='rotor_3_collision'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <cylinder>
            <length>0.005</length>
            <radius>0.1</radius>
          </cylinder>
        </geometry>
        <surface>
          <contact>
            <ode/>
          </contact>
          <friction>
            <ode/>
          </friction>
        </surface>
      </collision>
      <visual name='rotor_3_visual'>
        <pose>0 0 0 0 -0 0</pose>
        <geometry>
          <mesh>
            <scale>1 1 1</scale>
            <uri>model://quadcopter_model/meshes/iris_prop_cw.dae</uri>
          </mesh>
        </geometry>
        <material>
          <script>
            <name>Gazebo/DarkGrey</name>
            <uri>__default__</uri>
          </script>
        </material>
      </visual>
      <gravity>1</gravity>
      <velocity_decay/>
      <self_collide>0</self_collide>
    </link>
    <joint name='rotor_3_joint' type='revolute'>
      <child>rotor_3</child>
      <parent>base_link</parent>
      <axis>
        <xyz>0 0 1</xyz>
        <limit>
          <lower>-1e+16</lower>
          <upper>1e+16</upper>
        </limit>
        <dynamics>
          <damping>0.004</damping>
        </dynamics>
        <use_parent_model_frame>1</use_parent_model_frame>
      </axis>
      <physics>
        <ode>
          <implicit_spring_damper>1</implicit_spring_damper>
        </ode>
      </physics>
    </joint>
    <static>0</static>
  </model>
</sdf>
