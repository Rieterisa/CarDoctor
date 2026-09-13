/// Camera focus presets for the bundled CarConcept GLB.
class PartCameraFocus {
  const PartCameraFocus({
    required this.orbit,
    required this.target,
    required this.fieldOfView,
    this.hotspotPosition,
    this.hotspotNormal,
  });

  final String orbit;
  final String target;
  final String fieldOfView;
  final String? hotspotPosition;
  final String? hotspotNormal;

  static const overview = PartCameraFocus(
    orbit: '30deg 65deg 4.5m',
    target: '0m 0.4m 0m',
    fieldOfView: '35deg',
  );

  static PartCameraFocus forEntity(String entity) {
    return map[entity] ?? overview;
  }

  static const map = <String, PartCameraFocus>{
    'engine': PartCameraFocus(
      orbit: '40deg 72deg 3.4m',
      target: '0.85m 0.55m 0m',
      fieldOfView: '30deg',
      hotspotPosition: '0.9m 0.65m 0.05m',
      hotspotNormal: '0 1 0',
    ),
    'battery': PartCameraFocus(
      orbit: '15deg 78deg 3.1m',
      target: '0.95m 0.7m 0.35m',
      fieldOfView: '28deg',
      hotspotPosition: '1.0m 0.75m 0.35m',
      hotspotNormal: '0 1 0',
    ),
    'alternator': PartCameraFocus(
      orbit: '55deg 70deg 3.2m',
      target: '0.75m 0.5m -0.25m',
      fieldOfView: '28deg',
      hotspotPosition: '0.8m 0.55m -0.25m',
      hotspotNormal: '0 1 0',
    ),
    'maf_sensor': PartCameraFocus(
      orbit: '35deg 68deg 3.3m',
      target: '0.7m 0.7m 0.15m',
      fieldOfView: '28deg',
      hotspotPosition: '0.7m 0.8m 0.15m',
      hotspotNormal: '0 1 0',
    ),
    'throttle_body': PartCameraFocus(
      orbit: '30deg 68deg 3.2m',
      target: '0.65m 0.65m -0.05m',
      fieldOfView: '28deg',
      hotspotPosition: '0.65m 0.75m -0.05m',
      hotspotNormal: '0 1 0',
    ),
    'ignition_coil': PartCameraFocus(
      orbit: '28deg 65deg 3.0m',
      target: '0.8m 0.75m 0.08m',
      fieldOfView: '26deg',
      hotspotPosition: '0.8m 0.85m 0.08m',
      hotspotNormal: '0 1 0',
    ),
    'o2_sensor': PartCameraFocus(
      orbit: '120deg 85deg 3.4m',
      target: '-0.15m 0.25m 0.25m',
      fieldOfView: '30deg',
      hotspotPosition: '-0.1m 0.3m 0.3m',
      hotspotNormal: '0 1 0',
    ),
    'catalytic_converter': PartCameraFocus(
      orbit: '145deg 88deg 3.6m',
      target: '-0.45m 0.2m 0m',
      fieldOfView: '32deg',
      hotspotPosition: '-0.45m 0.25m 0m',
      hotspotNormal: '0 1 0',
    ),
    'fuel_pump': PartCameraFocus(
      orbit: '175deg 80deg 3.5m',
      target: '-0.85m 0.35m 0m',
      fieldOfView: '30deg',
      hotspotPosition: '-0.85m 0.4m 0m',
      hotspotNormal: '0 1 0',
    ),
    'abs_module': PartCameraFocus(
      orbit: '95deg 85deg 3.3m',
      target: '0.15m 0.3m -0.35m',
      fieldOfView: '28deg',
      hotspotPosition: '0.15m 0.35m -0.35m',
      hotspotNormal: '0 1 0',
    ),
    'crank_sensor': PartCameraFocus(
      orbit: '50deg 70deg 3.2m',
      target: '0.55m 0.35m 0.1m',
      fieldOfView: '28deg',
      hotspotPosition: '0.55m 0.4m 0.1m',
      hotspotNormal: '0 1 0',
    ),
    'cam_sensor': PartCameraFocus(
      orbit: '35deg 68deg 3.1m',
      target: '0.7m 0.7m 0m',
      fieldOfView: '28deg',
      hotspotPosition: '0.7m 0.75m 0m',
      hotspotNormal: '0 1 0',
    ),
    'knock_sensor': PartCameraFocus(
      orbit: '45deg 72deg 3.2m',
      target: '0.6m 0.45m -0.1m',
      fieldOfView: '28deg',
      hotspotPosition: '0.6m 0.5m -0.1m',
      hotspotNormal: '0 1 0',
    ),
    'ect_sensor': PartCameraFocus(
      orbit: '25deg 70deg 3.2m',
      target: '0.75m 0.55m 0.2m',
      fieldOfView: '28deg',
      hotspotPosition: '0.75m 0.6m 0.2m',
      hotspotNormal: '0 1 0',
    ),
    'evap': PartCameraFocus(
      orbit: '160deg 75deg 3.5m',
      target: '-0.6m 0.45m 0.15m',
      fieldOfView: '30deg',
      hotspotPosition: '-0.6m 0.5m 0.15m',
      hotspotNormal: '0 1 0',
    ),
  };
}
