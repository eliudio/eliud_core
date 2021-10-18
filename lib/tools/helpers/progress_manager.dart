typedef void ReportProgress(double progress);

/*
 * Helper that allows to report progress of a process with a number of steps. For example, creation of a
 * new app involves: 1) creating home menu, 2) creating app bar, 3) creating drawers 4) uploading policy pdf 5) ...
 * For this, we create a ProgressManager with a predetermined amount of steps. This steps all have an equal weights of 1, except
 * the specified weightedSteps, which could be estimate to be a multitude of the standard weight of 1.
 * Progress of a step is reported with progressedNextStep. Updates in between steps can be reported with progressWithinCurrentStep.
 *
 * For example use, see package eliud_pkg_create, new_app_bloc.dart
 */
class ProgressManager {
  final ReportProgress reportProgress;
  late int totalAmountOfWeightedSteps;
  int currentStep = 0;
  int weightedProgress = 0;

  // If some steps have a different weight than other steps, then provide a weight, e.g. if you want step 1 and step 3 to have weights of 2 and 5 respectively, then prove weightedSteps of { 1: 2, 3: 5 }
  final Map<int, int>? weightedSteps;

  ProgressManager(int totalAmountOfSteps, this.reportProgress, {this.weightedSteps}) {
    totalAmountOfWeightedSteps = totalAmountOfSteps;
    if (weightedSteps != null) {
      for (var weightedStep in weightedSteps!.values) {
        totalAmountOfWeightedSteps = totalAmountOfWeightedSteps + weightedStep - 1; // minus one because we've already considered it as 1
      }
    }
  }

  int getWeightCurrentStep() {
    if (weightedSteps != null) {
      var _value = weightedSteps![currentStep];
      if (_value != null) {
        return _value;
      }
    }
    return 1;
  }

  void progressedNextStep() {
    weightedProgress = weightedProgress + getWeightCurrentStep();
    var progress = weightedProgress / totalAmountOfWeightedSteps;
    reportProgress(progress);
    currentStep++;
  }

  void progressWithinCurrentStep(double progressWithinStep) {
    var weightedStep = getWeightCurrentStep();
    var progress = (weightedProgress + weightedStep * progressWithinStep) / totalAmountOfWeightedSteps;
    reportProgress(progress);
  }
}